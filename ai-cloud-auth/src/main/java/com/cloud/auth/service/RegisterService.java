package com.cloud.auth.service;

import com.cloud.common.constant.Constants;
import com.cloud.common.constant.LangConstants;
import com.cloud.common.constant.SecurityConstants;
import com.cloud.common.constant.UserConstants;
import com.cloud.common.domain.R;
import com.cloud.common.exception.ServiceException;
import com.cloud.common.utils.StringUtils;
import com.cloud.security.utils.SecurityUtils;
import com.cloud.user.api.domain.User;
import com.cloud.user.api.service.RemoteUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RegisterService {
    @Autowired
    private RemoteUserService remoteUserService;

    @Autowired
    private SysRecordLogService sysRecordLogService;

    /**
     * 用户账号密码注册
     *
     * @param username 用户名
     * @param password 密码
     * @param uuid     设备唯一标识
     * @param language 语言类型
     * @return 注册结果
     */
    public void registerUser(String username, String password, String phone, String uuid,String language) {
        // 用户名或密码为空 错误
        if (StringUtils.isAnyBlank(username, password)) {
            if (language.equals(LangConstants.EN_US)){
                throw new ServiceException("User/password must be filled in!");
            }else if (language.equals(LangConstants.ZH_CN)){
                throw new ServiceException("用户/密码必须填写!");
            }
        }
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            if (language.equals(LangConstants.EN_US)){
                throw new ServiceException("Account length must be between 2 and 20 characters!");
            }else if (language.equals(LangConstants.ZH_CN)){
                throw new ServiceException("账户长度必须在2到20个字符之间!");
            }
        }
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            if (language.equals(LangConstants.EN_US)){
                throw new ServiceException("Password length must be between 6 and 20 characters!");
            }else if (language.equals(LangConstants.ZH_CN)){
                throw new ServiceException("密码长度必须在6到20个字符之间!");
            }
        }
        // 注册用户信息
        User user = new User();
        user.setUserName(username);
        user.setPhone(phone);
        user.setUuid(uuid);
        user.setPassword(SecurityUtils.encryptPassword(password));
        R<?> registerResult = remoteUserService.registerUserInfo(user, language,SecurityConstants.INNER);
        if (R.FAIL == registerResult.getCode()) {
            throw new ServiceException(registerResult.getMsg());
        }
        if (language.equals(LangConstants.EN_US)){
            sysRecordLogService.recordLogininfor(username, Constants.REGISTER, "login was successful");
        }else if (language.equals(LangConstants.ZH_CN)){
            sysRecordLogService.recordLogininfor(username, Constants.REGISTER, "注册成功");
        }
    }


}
