package com.cloud.auth.service;

import com.anji.captcha.model.common.ResponseModel;
import com.anji.captcha.model.vo.CaptchaVO;
import com.anji.captcha.service.CaptchaService;
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
import com.cloud.redis.service.RedisService;
import com.cloud.security.utils.SecurityUtils;
import com.cloud.system.api.domain.SysUser;
import com.cloud.system.api.model.SysLoginUser;
import com.cloud.system.api.service.RemoteSysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 登录校验方法
 *
 * @author ai-cloud
 */
@Component
public class SysLoginService {
    @Autowired
    private RemoteSysUserService remoteSysUserService;

    @Autowired
    private SysPasswordService sysPasswordService;

    @Autowired
    private SysRecordLogService sysRecordLogService;

    @Autowired
    private CaptchaService captchaService;

    @Autowired
    private RedisService redisService;

    /**
     * 账号密码登录
     *
     * @param username 用户名
     * @param password 密码
     * @param code     验证码
     * @param uuid     设备唯一标识
     * @return 登录结果
     */
    public SysLoginUser login(String username, String password, String code, String uuid) {
        // 检验验证码
        CaptchaVO captchaVO = new CaptchaVO();
        captchaVO.setCaptchaVerification(code);
        ResponseModel response = captchaService.verification(captchaVO);
        if (!response.isSuccess()) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "验证失败");
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
        // IP黑名单校验
        String blackStr = Convert.toStr(redisService.getCacheObject(CacheConstants.SYS_LOGIN_BLACKIPLIST));
        if (IpUtils.isMatchedIp(blackStr, IpUtils.getIpAddr())) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "很遗憾，访问IP已被列入系统黑名单");
            throw new ServiceException("很遗憾，访问IP已被列入系统黑名单");
        }
        // 查询用户信息
        R<SysLoginUser> userResult = remoteSysUserService.getSysUserInfo(username, SecurityConstants.INNER);
        if (StringUtils.isNull(userResult) || StringUtils.isNull(userResult.getData())) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "登录用户不存在");
            throw new ServiceException("登录用户：" + username + " 不存在!");
        }
        if (R.FAIL == userResult.getCode()) {
            throw new ServiceException(userResult.getMsg());
        }
        SysLoginUser userInfo = userResult.getData();
        SysUser sysUser = userResult.getData().getSysUser();
        if (UserStatus.DELETED.getCode().equals(sysUser.getDelFlag())) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "对不起，您的账号已被删除");
            throw new ServiceException("对不起，您的账号：" + username + " 已被删除");
        }
        if (UserStatus.DISABLE.getCode().equals(sysUser.getStatus())) {
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, "用户已停用，请联系管理员");
            throw new ServiceException("对不起，您的账号：" + username + " 已停用");
        }
        sysPasswordService.validate(sysUser, password);
        sysRecordLogService.recordLogininfor(username, Constants.LOGIN_SUCCESS, "登录成功");
        return userInfo;
    }

    /**
     * 账号密码注册
     *
     * @param username 用户名
     * @param password 密码
     * @return 注册结果
     */
    public void register(String username, String password) {
        // 用户名或密码为空 错误
        if (StringUtils.isAnyBlank(username, password)) {
            throw new ServiceException("用户/密码必须填写");
        }
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            throw new ServiceException("账户长度必须在2到20个字符之间");
        }
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            throw new ServiceException("密码长度必须在5到20个字符之间");
        }

        // 注册用户信息
        SysUser sysUser = new SysUser();
        sysUser.setUserName(username);
        sysUser.setNickName(username);
        sysUser.setPassword(SecurityUtils.encryptPassword(password));
        R<?> registerResult = remoteSysUserService.registerUserInfo(sysUser, SecurityConstants.INNER);

        if (R.FAIL == registerResult.getCode()) {
            throw new ServiceException(registerResult.getMsg());
        }
        sysRecordLogService.recordLogininfor(username, Constants.REGISTER, "注册成功");
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
