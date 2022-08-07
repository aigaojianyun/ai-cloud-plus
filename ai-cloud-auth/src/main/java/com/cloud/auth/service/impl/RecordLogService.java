package com.cloud.auth.service.impl;

import com.cloud.auth.api.domain.UserLoginLog;
import com.cloud.auth.api.domain.UserRegistryLog;
import com.cloud.auth.api.service.RemoteLogService;
import com.cloud.common.constant.Constants;
import com.cloud.common.constant.SecurityConstants;
import com.cloud.common.utils.ServletUtils;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.utils.ip.IpUtils;
import com.cloud.common.utils.uuid.IdUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 记录日志方法
 *
 * @author ai-cloud
 */
@Component
public class RecordLogService {

    @Autowired
    private RemoteLogService remoteLogService;

    /**
     * 记录登录信息
     *
     * @param username 用户名
     * @param status   状态
     * @param message  消息内容
     * @return
     */
    public void recordLoginLog(String username, String deviceId, String status, String message) {
        UserLoginLog userLoginLog = new UserLoginLog();
        userLoginLog.setId(IdUtils.fastSimpleUUID());
        userLoginLog.setUserName(username);
        userLoginLog.setDeviceId(deviceId);
        userLoginLog.setIpaddr(IpUtils.getIpAddr(ServletUtils.getRequest()));
        userLoginLog.setMsg(message);
        // 日志状态
        if (StringUtils.equalsAny(status, Constants.LOGIN_SUCCESS, Constants.LOGOUT, Constants.REGISTER)) {
            userLoginLog.setStatus(Constants.LOGIN_SUCCESS_STATUS);
        } else if (Constants.LOGIN_FAIL.equals(status)) {
            userLoginLog.setStatus(Constants.LOGIN_FAIL_STATUS);
        }
        remoteLogService.saveUserLoginLog(userLoginLog, SecurityConstants.INNER);
    }

    /**
     * 记录注册信息
     *
     * @param username 用户名
     * @param status   状态
     * @param message  消息内容
     * @return
     */
    public void recordRegistryLog(String username, String deviceId, String status, String message) {
        UserRegistryLog userRegistryLog = new UserRegistryLog();
        userRegistryLog.setId(IdUtils.fastSimpleUUID());
        userRegistryLog.setUserName(username);
        userRegistryLog.setDeviceId(deviceId);
        userRegistryLog.setIpaddr(IpUtils.getIpAddr(ServletUtils.getRequest()));
        userRegistryLog.setMsg(message);
        // 日志状态
        if (StringUtils.equalsAny(status, Constants.LOGIN_SUCCESS, Constants.LOGOUT, Constants.REGISTER)) {
            userRegistryLog.setStatus(Constants.LOGIN_SUCCESS_STATUS);
        } else if (Constants.LOGIN_FAIL.equals(status)) {
            userRegistryLog.setStatus(Constants.LOGIN_FAIL_STATUS);
        }
        remoteLogService.saveUserRegistryLog(userRegistryLog, SecurityConstants.INNER);
    }
}
