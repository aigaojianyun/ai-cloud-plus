package com.cloud.auth.service;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.nacos.common.codec.Base64;
import com.anji.captcha.model.common.ResponseModel;
import com.anji.captcha.model.vo.CaptchaVO;
import com.anji.captcha.service.CaptchaService;
import com.cloud.auth.domain.Code2Session;
import com.cloud.auth.param.WeiXinLoginParam;
import com.cloud.common.constant.Constants;
import com.cloud.common.constant.SecurityConstants;
import com.cloud.common.constant.UserConstants;
import com.cloud.common.domain.R;
import com.cloud.common.enums.UserStatus;
import com.cloud.common.exception.CaptchaException;
import com.cloud.common.exception.ServiceException;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.utils.uuid.IdUtils;
import com.cloud.user.api.domain.User;
import com.cloud.user.api.model.LoginUser;
import com.cloud.user.api.service.RemoteUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Objects;

/**
 * 登录校验方法
 *
 * @author ai-cloud
 */
@Component
public class LoginService {

    @Autowired
    private RemoteUserService remoteUserService;

    @Autowired
    private SysRecordLogService sysRecordLogService;

    @Autowired
    private PasswordService passwordService;

    @Autowired
    private CaptchaService captchaService;

    @Autowired
    private WeiXinService weiXinService;

    /**
     * 账号密码登录
     *
     * @param username 用户名
     * @param password 密码
     * @param code     验证码
     * @param uuid     设备唯一标识
     * @return 登录结果
     */
    public LoginUser login(String username, String password, String code, String uuid) {
        // 检验验证码
        CaptchaVO captchaVO = new CaptchaVO();
        captchaVO.setCaptchaVerification(code);
        ResponseModel response = captchaService.verification(captchaVO);
        if (!response.isSuccess()) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "user.jcaptcha.error");
            throw new CaptchaException("验证失败!");
        }
        // 用户名或密码为空 错误
        if (StringUtils.isAnyBlank(username, password)) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户/密码必须填写");
            throw new ServiceException("用户/密码必须填写!");
        }
        // 密码如果不在指定范围内 错误
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户密码不在指定范围");
            throw new ServiceException("用户密码不在指定范围!");
        }
        // 用户名不在指定范围内 错误
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户名不在指定范围");
            throw new ServiceException("用户名不在指定范围!");
        }
        // 查询用户信息
        R<LoginUser> userResult = remoteUserService.getUserInfo(username, SecurityConstants.INNER);
        if (StringUtils.isNull(userResult) || StringUtils.isNull(userResult.getData())) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "登录用户不存在");
            throw new ServiceException("登录用户：" + username + " 不存在!");
        }
        if (R.FAIL == userResult.getCode()) {
            throw new ServiceException(userResult.getMsg());
        }
        LoginUser userInfo = userResult.getData();
        User user = userResult.getData().getUser();
        if (UserStatus.DELETED.getCode().equals(user.getDeleteFlag())) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "对不起，您的账号已被删除");
            throw new ServiceException("对不起，您的账号：" + username + " 已被删除");
        }
        if (UserStatus.DISABLE.getCode().equals(user.getStatusFlag())) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户已停用，请联系管理员");
            throw new ServiceException("对不起，您的账号：" + username + " 已停用");
        }
        passwordService.validate(user, password);
        sysRecordLogService.recordLogininfor(username, Constants.LOGIN_SUCCESS, "登录成功");
        return userInfo;
    }

    /**
     * 微信授权登录
     *
     * @param param 授权参数
     * @return 登录结果
     */
    public LoginUser loginWx(WeiXinLoginParam param) {
        Code2Session code2Session = weiXinService.codeSession(param.getCode());
        LoginUser userInfo = null;
        if (StringUtils.isNotEmpty(code2Session.getOpenId())) {
            // 解析电话号码
            String phoneNumber;
            byte[] byEncrypdata = Base64.decodeBase64(param.getEncryptedData().getBytes());
            byte[] byIvdata = Base64.decodeBase64(param.getIv().getBytes());
            byte[] bySessionkey = Base64.decodeBase64(code2Session.getSessionKey().getBytes());
            AlgorithmParameterSpec ivSpec = new IvParameterSpec(byIvdata);
            try {
                SecretKeySpec keySpec = new SecretKeySpec(bySessionkey, "AES");
                Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                cipher.init(Cipher.DECRYPT_MODE, keySpec, ivSpec);
                String phoneResult = new String(cipher.doFinal(byEncrypdata), StandardCharsets.UTF_8);
                JSONObject phoneObject = JSONObject.parseObject(phoneResult);
                phoneNumber = phoneObject.getString("phoneNumber");
            } catch (Exception e) {
                e.printStackTrace();
                throw new ServiceException("手机号码解密失败!");
            }
            // 根据openId查询是否存在这个用户
            R<LoginUser> userResult = remoteUserService.getUserInfo(code2Session.getOpenId(), SecurityConstants.INNER);
            if (StringUtils.isNull(userResult) || StringUtils.isNull(userResult.getData().getUser())) {
                // 添加新用户
                User user = new User();
                user.setUserName(IdUtils.fastSimpleUUID());
                user.setNickName(param.getNickName());
                user.setPhone(phoneNumber);
                user.setHeadImg(param.getAvatarUrl());
                user.setOpenId(code2Session.getOpenId());
                user.setSessionKey(code2Session.getSessionKey());
                if (Objects.equals(param.getGender(), 0)) {
                    user.setSex("2");
                } else if (Objects.equals(param.getGender(), 1)) {
                    user.setSex("0");
                } else if (Objects.equals(param.getGender(), 2)) {
                    user.setSex("1");
                }
                R<?> registerResult = remoteUserService.registerUserInfo(user, SecurityConstants.INNER);
                if (R.FAIL == registerResult.getCode()) {
                    throw new ServiceException(registerResult.getMsg());
                }
                sysRecordLogService.recordLogininfor(code2Session.getOpenId(), Constants.REGISTER, "注册成功");
            } else {
                // 存在就更新用户信息
                User user = userResult.getData().getUser();
                R<?> updateResult = remoteUserService.updateUserInfo(user, SecurityConstants.INNER);
                if (R.FAIL == updateResult.getCode()) {
                    throw new ServiceException(updateResult.getMsg());
                }
                sysRecordLogService.recordLogininfor(code2Session.getOpenId(), Constants.REGISTER, "更新成功");
            }
            // 根据openId查询用户
            R<LoginUser> userResults = remoteUserService.getUserInfo(code2Session.getOpenId(), SecurityConstants.INNER);
            userInfo = userResults.getData();
            // 用户信息
            User user = userResults.getData().getUser();
            if (StringUtils.isNotNull(user)) {
                if (UserStatus.DELETED.getCode().equals(user.getDeleteFlag())) {
                    sysRecordLogService.recordLogininfor(phoneNumber, Constants.LOGIN_FAIL, "对不起，您的账号已被删除");
                    throw new ServiceException("对不起，您的账号：" + phoneNumber + " 已被删除");
                }
                if (UserStatus.DISABLE.getCode().equals(user.getStatusFlag())) {
                    sysRecordLogService.recordLogininfor(phoneNumber, Constants.LOGIN_FAIL, "用户已停用，请联系管理员");
                    throw new ServiceException("对不起，您的账号：" + phoneNumber + " 已停用");
                }
            }
            sysRecordLogService.recordLogininfor(code2Session.getOpenId(), Constants.LOGIN_SUCCESS, "登录成功");
        }
        return userInfo;
    }

    /**
     * 退出登录
     *
     * @param loginName 请求对象
     * @return 结果
     */
    public void logout(String loginName) {
        sysRecordLogService.recordLogininfor(loginName, Constants.LOGOUT, "退出成功");
    }

}
