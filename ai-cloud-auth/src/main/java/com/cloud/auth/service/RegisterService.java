package com.cloud.auth.service;

import com.cloud.common.constant.Constants;
import com.cloud.common.constant.SecurityConstants;
import com.cloud.common.constant.UserConstants;
import com.cloud.common.domain.R;
import com.cloud.common.exception.ServiceException;
import com.cloud.common.utils.StringUtils;
import com.cloud.i18n.utils.MessageUtils;
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
     * @return 注册结果
     */
    public void registerUser(String username, String password, String phone, String uuid,String language) {
        // 用户名或密码为空 错误
        if (StringUtils.isAnyBlank(username, password)) {
            throw new ServiceException(MessageUtils.message("user.username.password.is.not"));
        }
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            throw new ServiceException(MessageUtils.message("user.length.not.valid"));
        }
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            throw new ServiceException(MessageUtils.message("user.username.not.valid"));
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
        sysRecordLogService.recordLogininfor(username, Constants.REGISTER, MessageUtils.message("user.register.success"));
    }


}
