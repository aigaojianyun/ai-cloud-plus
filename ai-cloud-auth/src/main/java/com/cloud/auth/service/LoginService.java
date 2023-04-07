package com.cloud.auth.service;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.nacos.common.codec.Base64;
import com.anji.captcha.model.common.ResponseModel;
import com.anji.captcha.model.vo.CaptchaVO;
import com.anji.captcha.service.CaptchaService;
import com.cloud.auth.param.VerifyCodeParam;
import com.cloud.auth.param.VerifyPhoneParam;
import com.cloud.auth.param.WeiXinLoginParam;
import com.cloud.common.constant.CacheConstants;
import com.cloud.common.constant.Constants;
import com.cloud.common.constant.SecurityConstants;
import com.cloud.common.constant.UserConstants;
import com.cloud.common.domain.R;
import com.cloud.common.enums.UserStatus;
import com.cloud.common.exception.CaptchaException;
import com.cloud.common.exception.ServiceException;
import com.cloud.common.text.Convert;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.utils.ip.IpUtils;
import com.cloud.common.utils.uuid.IdUtils;
import com.cloud.i18n.utils.MessageUtils;
import com.cloud.redis.service.RedisService;
import com.cloud.user.api.domain.User;
import com.cloud.user.api.model.LoginUser;
import com.cloud.user.api.service.RemoteUserService;
import me.chanjar.weixin.common.error.WxErrorException;
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
    private WxMaService wxMaService;

    @Autowired
    private RedisService redisService;

    /**
     * 账号密码登录
     *
     * @param username 用户名
     * @param password 密码
     * @param code     验证码
     * @param uuid     设备唯一标识
     * @param language 语言类型
     * @return 登录结果
     */
    public LoginUser login(String username, String password, String code, String uuid, String language) {
        // 检验验证码
        CaptchaVO captchaVO = new CaptchaVO();
        captchaVO.setCaptchaVerification(code);
        ResponseModel response = captchaService.verification(captchaVO);
        if (!response.isSuccess()) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.captcha.expire"));
            throw new CaptchaException(MessageUtils.message("user.captcha.expire"));
        }
        // 用户名或密码为空 错误
        if (StringUtils.isAnyBlank(username, password)) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.username.password.is.not"));
            throw new ServiceException(MessageUtils.message("user.username.password.is.not"));
        }
        // 密码如果不在指定范围内 错误
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.is.not"));
            throw new ServiceException(MessageUtils.message("user.password.is.not"));
        }
        // 用户名不在指定范围内 错误
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.username.is.not"));
            throw new ServiceException(MessageUtils.message("user.username.is.not"));
        }
        // IP黑名单校验
        String blackStr = Convert.toStr(redisService.getCacheObject(CacheConstants.SYS_LOGIN_BLACKIPLIST));
        if (IpUtils.isMatchedIp(blackStr, IpUtils.getIpAddr())) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("login.blocked"));
            throw new ServiceException(MessageUtils.message("login.blocked"));
        }
        // 查询用户信息
        R<LoginUser> userResult = remoteUserService.getUserInfo(username, language, SecurityConstants.INNER);
        if (StringUtils.isNull(userResult) || StringUtils.isNull(userResult.getData())) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.login.username") + username + MessageUtils.message("user.login.username.not"));
            throw new ServiceException(MessageUtils.message("user.login.username") + username + MessageUtils.message("user.login.username.not"));
        }
        if (R.FAIL == userResult.getCode()) {
            throw new ServiceException(userResult.getMsg());
        }
        LoginUser userInfo = userResult.getData();
        // 用户信息
        User user = userResult.getData().getUser();
        // 是否删除
        if (UserStatus.DELETED.getCode().equals(user.getDeleteFlag())) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.delete"));
            throw new ServiceException(MessageUtils.message("user.login.sorry") + username + MessageUtils.message("user.login.sorry.delete"));
        }
        // 是否停用
        if (UserStatus.DISABLE.getCode().equals(user.getStatusFlag())) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.blocked"));
            throw new ServiceException(MessageUtils.message("user.login.sorry") + username + MessageUtils.message("user.login.sorry.blocked"));
        }
        passwordService.validate(user, password, language);
        sysRecordLogService.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success"));
        return userInfo;
    }

    /**
     * 验证码登录
     *
     * @param param    登录参数
     * @param language 语言类型
     * @return 登录结果
     */
    public LoginUser loginPhone(VerifyCodeParam param, String language) {
        LoginUser userInfo = null;
        // 从缓存中获取验证码
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + param.getPhone();
        String codeKey = redisService.getCacheObject(verifyKey);
        // 校验验证码是否过期
        if (StringUtils.isNull(codeKey)) {
            throw new ServiceException(MessageUtils.message("user.captcha.expires"));
        }
        // 校验验证码是否正确
        if (!param.getCode().equals(codeKey)) {
            throw new ServiceException(MessageUtils.message("user.captcha.error"));
        }
        // 根据手机号查询是否存在这个用户
        R<LoginUser> userResult = remoteUserService.getUserInfo(param.getPhone(), language, SecurityConstants.INNER);
        if (StringUtils.isNull(userResult) || StringUtils.isNull(userResult.getData().getUser())) {
            // 不存在就创建新用户
            User user = new User();
            user.setUserName(IdUtils.fastSimpleUUID());
            user.setPhone(param.getPhone());
            R<?> registerResult = remoteUserService.registerUserInfo(user, language, SecurityConstants.INNER);
            if (R.FAIL == registerResult.getCode()) {
                throw new ServiceException(registerResult.getMsg());
            }
            sysRecordLogService.recordLogininfor(param.getPhone(), Constants.REGISTER, MessageUtils.message("user.register.success"));
        } else {
            // 存在就更新用户信息
            User user = userResult.getData().getUser();
            R<?> updateResult = remoteUserService.updateUserInfo(user, language, SecurityConstants.INNER);
            if (R.FAIL == updateResult.getCode()) {
                throw new ServiceException(updateResult.getMsg());
            }
            sysRecordLogService.recordLogininfor(param.getPhone(), Constants.REGISTER, MessageUtils.message("user.update.success"));
        }
        // 根据手机号查询查询用户
        R<LoginUser> userResults = remoteUserService.getUserInfo(param.getPhone(), language, SecurityConstants.INNER);
        userInfo = userResults.getData();
        // 用户信息
        User user = userResults.getData().getUser();
        // 是否删除
        if (UserStatus.DELETED.getCode().equals(user.getDeleteFlag())) {
            sysRecordLogService.recordLogininfor(param.getPhone(), Constants.LOGIN_FAIL, MessageUtils.message("user.delete"));
            throw new ServiceException(MessageUtils.message("user.login.sorry") + param.getPhone() + MessageUtils.message("user.login.sorry.delete"));
        }
        // 是否停用
        if (UserStatus.DISABLE.getCode().equals(user.getStatusFlag())) {
            sysRecordLogService.recordLogininfor(param.getPhone(), Constants.LOGIN_FAIL, MessageUtils.message("user.blocked"));
            throw new ServiceException(MessageUtils.message("user.login.sorry") + param.getPhone() + MessageUtils.message("user.login.sorry.blocked"));
        }
        sysRecordLogService.recordLogininfor(param.getPhone(), Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success"));
        // 删除验证码
        redisService.deleteObject(verifyKey);
        return userInfo;
    }

    /**
     * 一键登录
     *
     * @param param    登录参数
     * @param language 语言类型
     * @return 登录结果
     */
    public LoginUser loginOnesTep(VerifyPhoneParam param, String language) {
        LoginUser userInfo = new LoginUser();
        return userInfo;
    }

    /**
     * 微信授权登录
     *
     * @param param    授权参数
     * @param language 语言类型
     * @return 登录结果
     */
    public LoginUser loginWeiXin(WeiXinLoginParam param, String language) throws WxErrorException {
        // 获取微信用户session
        WxMaJscode2SessionResult session = wxMaService.getUserService().getSessionInfo(param.getCode());
        LoginUser userInfo = null;
        if (StringUtils.isNotEmpty(session.getOpenid())) {
            // 解析电话号码
            String phoneNumber;
            byte[] byEncrypdata = Base64.decodeBase64(param.getEncryptedData().getBytes());
            byte[] byIvdata = Base64.decodeBase64(param.getIv().getBytes());
            byte[] bySessionkey = Base64.decodeBase64(session.getSessionKey().getBytes());
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
                throw new ServiceException(MessageUtils.message("user.phone.number"));
            }
            // 根据openId查询是否存在这个用户
            R<LoginUser> userResult = remoteUserService.getUserInfo(session.getOpenid(), language, SecurityConstants.INNER);
            if (StringUtils.isNull(userResult) || StringUtils.isNull(userResult.getData().getUser())) {
                // 创建新用户
                User user = new User();
                user.setUserName(IdUtils.fastSimpleUUID());
                user.setNickName(param.getNickName());
                user.setPhone(phoneNumber);
                user.setHeadImg(param.getAvatarUrl());
                user.setOpenId(session.getOpenid());
                user.setSessionKey(session.getSessionKey());
                if (Objects.equals(param.getGender(), 0)) {
                    user.setSex("2");
                } else if (Objects.equals(param.getGender(), 1)) {
                    user.setSex("0");
                } else if (Objects.equals(param.getGender(), 2)) {
                    user.setSex("1");
                }
                R<?> registerResult = remoteUserService.registerUserInfo(user, language, SecurityConstants.INNER);
                if (R.FAIL == registerResult.getCode()) {
                    throw new ServiceException(registerResult.getMsg());
                }
                sysRecordLogService.recordLogininfor(session.getOpenid(), Constants.REGISTER, MessageUtils.message("user.register.success"));
            } else {
                // 存在就更新用户信息
                User user = userResult.getData().getUser();
                R<?> updateResult = remoteUserService.updateUserInfo(user, language, SecurityConstants.INNER);
                if (R.FAIL == updateResult.getCode()) {
                    throw new ServiceException(updateResult.getMsg());
                }
                sysRecordLogService.recordLogininfor(session.getOpenid(), Constants.REGISTER, MessageUtils.message("user.update.success"));
            }
            // 根据openId查询用户
            R<LoginUser> userResults = remoteUserService.getUserInfo(session.getOpenid(), language, SecurityConstants.INNER);
            userInfo = userResults.getData();
            // 用户信息
            User user = userResults.getData().getUser();
            if (StringUtils.isNotNull(user)) {
                // 是否删除
                if (UserStatus.DELETED.getCode().equals(user.getDeleteFlag())) {
                    sysRecordLogService.recordLogininfor(phoneNumber, Constants.LOGIN_FAIL, MessageUtils.message("user.delete"));
                    throw new ServiceException(MessageUtils.message("user.login.sorry") + phoneNumber + MessageUtils.message("user.login.sorry.delete"));
                }
                // 是否停用
                if (UserStatus.DISABLE.getCode().equals(user.getStatusFlag())) {
                    sysRecordLogService.recordLogininfor(phoneNumber, Constants.LOGIN_FAIL, MessageUtils.message("user.blocked"));
                    throw new ServiceException(MessageUtils.message("user.login.sorry") + phoneNumber + MessageUtils.message("user.login.sorry.blocked"));
                }
            }
            sysRecordLogService.recordLogininfor(session.getOpenid(), Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success"));
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
        sysRecordLogService.recordLogininfor(loginName, Constants.LOGOUT, MessageUtils.message("user.logout.success"));
    }

}
