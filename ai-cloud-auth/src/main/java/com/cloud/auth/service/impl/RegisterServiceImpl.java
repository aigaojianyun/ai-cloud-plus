package com.cloud.auth.service.impl;

import com.cloud.auth.api.domain.User;
import com.cloud.auth.api.service.RemoteUserService;
import com.cloud.auth.service.RegisterService;
import com.cloud.common.constant.Constants;
import com.cloud.common.constant.SecurityConstants;
import com.cloud.common.constant.UserConstants;
import com.cloud.common.exception.ServiceException;
import com.cloud.common.model.Response;
import com.cloud.common.utils.StringUtils;
import com.cloud.security.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 * 注册校验方法
 *
 * @author ai-cloud
 */
@Service
@Component
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RemoteUserService remoteUserService;

    @Autowired
    private RecordLogService recordLogService;

    /**
     * 账号密码注册
     *
     * @param username 用户名
     * @param password 密码
     * @param deviceId 设备唯一标识
     * @return 注册结果
     */
    @Override
    public void register(String username, String password, String deviceId) {
        // 用户名或密码为空 错误
        if (StringUtils.isAnyBlank(username, password)) {
            throw new ServiceException("用户/密码必须填写");
        }
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            throw new ServiceException("账户长度必须在6到12个字符之间");
        }
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            throw new ServiceException("密码长度必须在6到18个字符之间");
        }
        // 注册用户信息
        User user = new User();
        user.setUserName(username);
        user.setDeviceId(deviceId);
        user.setPassword(SecurityUtils.encryptPassword(password));
        Response<?> registerResult = remoteUserService.registerUserInfo(user, SecurityConstants.INNER);
        if (Response.FAIL == registerResult.getCode()) {
            throw new ServiceException(registerResult.getMsg());
        }
        recordLogService.recordRegistryLog(username, deviceId, Constants.REGISTER, "注册成功");
    }


}
