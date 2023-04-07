package com.cloud.auth.service;

import com.cloud.common.constant.CacheConstants;
import com.cloud.common.constant.Constants;
import com.cloud.common.exception.ServiceException;
import com.cloud.i18n.utils.MessageUtils;
import com.cloud.redis.service.RedisService;
import com.cloud.security.utils.SecurityUtils;
import com.cloud.user.api.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
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

    @Autowired
    private SysRecordLogService sysRecordLogService;

    private int maxRetryCount = CacheConstants.PASSWORD_MAX_RETRY_COUNT;

    private Long lockTime = CacheConstants.PASSWORD_LOCK_TIME;

    @Autowired
    private MessageSource messageSource;
    /**
     * 登录账户密码错误次数缓存键名
     *
     * @param username 用户名
     * @return 缓存键key
     */
    private String getCacheKey(String username) {
        return CacheConstants.PWD_ERR_CNT_KEY + username;
    }

    public void validate(User user, String password,String language) {
        String username = user.getUserName();

        Integer retryCount = redisService.getCacheObject(getCacheKey(username));

        if (retryCount == null) {
            retryCount = 0;
        }

        if (retryCount >= Integer.valueOf(maxRetryCount).intValue()) {
            String errMsg = String.format(MessageUtils.message("user.password.retry.limit.exceed"), maxRetryCount, lockTime);
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, errMsg);
            throw new ServiceException(errMsg);
        }

        if (!matches(user, password)) {
            retryCount = retryCount + 1;
            sysRecordLogService.recordLogininfor(username, Constants.LOGIN_FAIL, String.format(MessageUtils.message("user.password.retry.limit.count"), retryCount));
            redisService.setCacheObject(getCacheKey(username), retryCount, lockTime, TimeUnit.MINUTES);
            throw new ServiceException(MessageUtils.message("user.password.not.match"));
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

