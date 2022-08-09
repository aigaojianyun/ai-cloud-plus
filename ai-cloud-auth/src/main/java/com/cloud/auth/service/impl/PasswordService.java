package com.cloud.auth.service.impl;

import com.cloud.auth.api.domain.User;
import com.cloud.common.constant.CacheConstants;
import com.cloud.common.constant.Constants;
import com.cloud.common.exception.ServiceException;
import com.cloud.common.redis.service.RedisService;
import com.cloud.security.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;


/**
 * 登录密码方法
 *
 * @author ai-cloud
 */
@Component
public class PasswordService {

    @Autowired
    private RedisService redisService;

    private int maxRetryCount = CacheConstants.passwordMaxRetryCount;

    private Long lockTime = CacheConstants.passwordLockTime;

    @Autowired
    private RecordLogService recordLogService;

    /**
     * 登录账户密码错误次数缓存键名
     *
     * @param username 用户名
     * @return 缓存键key
     */
    private String getCacheKey(String username) {
        return CacheConstants.PWD_ERR_CNT_KEY + username;
    }

    public void validate(User user, String password) {
        String username = user.getUserName();
        String deviceId = user.getDeviceId();
        Integer retryCount = redisService.getCacheObject(getCacheKey(username));

        if (retryCount == null) {
            retryCount = 0;
        }

        if (retryCount >= Integer.valueOf(maxRetryCount).intValue()) {
            String errMsg = String.format("密码输入错误%s次，帐户锁定%s分钟", maxRetryCount, lockTime);
            recordLogService.recordLoginLog(username, deviceId, Constants.LOGIN_FAIL, errMsg);
            throw new ServiceException(errMsg);
        }

        if (!matches(user, password)) {
            retryCount = retryCount + 1;
            recordLogService.recordLoginLog(username, deviceId, Constants.LOGIN_FAIL, String.format("密码输入错误%s次", retryCount));
            redisService.setCacheObject(getCacheKey(username), retryCount, lockTime, TimeUnit.MINUTES);
            throw new ServiceException("用户不存在/密码错误");
        } else {
            clearLoginRecordCache(username);
        }
    }

    public boolean matches(User user, String rawPassword) {
        return SecurityUtils.matchesPassword(rawPassword, user.getPassword());
    }

    public void clearLoginRecordCache(String loginName) {
        if (redisService.hasKey(getCacheKey(loginName))) {
            redisService.deleteObject(getCacheKey(loginName));
        }
    }
}