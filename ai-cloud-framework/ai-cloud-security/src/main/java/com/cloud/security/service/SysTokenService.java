package com.cloud.security.service;

import com.cloud.common.constant.CacheConstants;
import com.cloud.common.constant.SecurityConstants;
import com.cloud.common.utils.JwtUtils;
import com.cloud.common.utils.ServletUtils;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.utils.ip.IpUtils;
import com.cloud.common.utils.uuid.IdUtils;
import com.cloud.redis.service.RedisService;
import com.cloud.security.utils.SecurityUtils;
import com.cloud.system.api.model.SysLoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * token验证处理
 *
 * @author ai-cloud
 */
@Component
public class SysTokenService {
    protected static final long MILLIS_SECOND = 1000;
    protected static final long MILLIS_MINUTE = 60 * MILLIS_SECOND;
    private final static Long MILLIS_MINUTE_TEN = CacheConstants.REFRESH_TIME * MILLIS_MINUTE;
    private final static long EXPIRE_TIME = CacheConstants.EXPIRATION;
    private final static String ACCESS_TOKEN = CacheConstants.LOGIN_TOKEN_KEY;
    @Autowired
    private RedisService redisService;

    /**
     * 创建令牌
     */
    public Map<String, Object> createToken(SysLoginUser sysLoginUser) {
        String token = IdUtils.fastSimpleUUID();
        Long userId = sysLoginUser.getSysUser().getUserId();
        String userName = sysLoginUser.getSysUser().getUserName();
        sysLoginUser.setToken(token);
        sysLoginUser.setUserid(userId);
        sysLoginUser.setUsername(userName);
        sysLoginUser.setIpaddr(IpUtils.getIpAddr());
        refreshToken(sysLoginUser);

        // Jwt存储信息
        Map<String, Object> claimsMap = new HashMap<String, Object>();
        claimsMap.put(SecurityConstants.USER_KEY, token);
        claimsMap.put(SecurityConstants.DETAILS_USER_ID, userId);
        claimsMap.put(SecurityConstants.DETAILS_USERNAME, userName);

        // 接口返回信息
        Map<String, Object> rspMap = new HashMap<String, Object>();
        rspMap.put("access_token", JwtUtils.createToken(claimsMap));
        rspMap.put("expires_in", EXPIRE_TIME);
        return rspMap;
    }

    /**
     * 获取用户身份信息
     *
     * @return 用户信息
     */
    public SysLoginUser getLoginUser() {
        return getLoginUser(ServletUtils.getRequest());
    }

    /**
     * 设置用户身份信息
     */
    public void setLoginUser(SysLoginUser sysLoginUser) {
        if (StringUtils.isNotNull(sysLoginUser) && StringUtils.isNotEmpty(sysLoginUser.getToken())) {
            refreshToken(sysLoginUser);
        }
    }

    /**
     * 获取用户身份信息
     *
     * @return 用户信息
     */
    public SysLoginUser getLoginUser(HttpServletRequest request) {
        // 获取请求携带的令牌
        String token = SecurityUtils.getToken(request);
        return getLoginUser(token);
    }

    /**
     * 获取用户身份信息
     *
     * @return 用户信息
     */
    public SysLoginUser getLoginUser(String token) {
        SysLoginUser sysUser = null;
        try {
            if (StringUtils.isNotEmpty(token)) {
                String userkey = JwtUtils.getUserKey(token);
                sysUser = redisService.getCacheObject(getTokenKey(userkey));
                return sysUser;
            }
        } catch (Exception e) {
        }
        return sysUser;
    }

    /**
     * 删除用户缓存信息
     */
    public void delLoginUser(String token) {
        if (StringUtils.isNotEmpty(token)) {
            String userkey = JwtUtils.getUserKey(token);
            redisService.deleteObject(getTokenKey(userkey));
        }
    }

    /**
     * 验证令牌有效期，相差不足120分钟，自动刷新缓存
     *
     * @param sysLoginUser
     */
    public void verifyToken(SysLoginUser sysLoginUser) {
        long expireTime = sysLoginUser.getExpireTime();
        long currentTime = System.currentTimeMillis();
        if (expireTime - currentTime <= MILLIS_MINUTE_TEN) {
            refreshToken(sysLoginUser);
        }
    }

    /**
     * 刷新令牌有效期
     *
     * @param sysLoginUser 登录信息
     */
    public void refreshToken(SysLoginUser sysLoginUser) {
        sysLoginUser.setLoginTime(System.currentTimeMillis());
        sysLoginUser.setExpireTime(sysLoginUser.getLoginTime() + EXPIRE_TIME * MILLIS_MINUTE);
        // 如果用户不允许多终端同时登录，清除缓存信息
        String userIdKey = CacheConstants.LOGIN_SYS_USER_KEY + sysLoginUser.getUserid();
        String userKey = redisService.getCacheObject(userIdKey);
        if (StringUtils.isNotEmpty(userKey)) {
            redisService.deleteObject(userIdKey);
            redisService.deleteObject(userKey);
        }
        // 根据uuid将loginUser缓存
        userKey = getTokenKey(sysLoginUser.getToken());
        redisService.setCacheObject(userIdKey, userKey, EXPIRE_TIME, TimeUnit.MINUTES);
        redisService.setCacheObject(userKey, sysLoginUser, EXPIRE_TIME, TimeUnit.MINUTES);

        //sysLoginUser.setLoginTime(System.currentTimeMillis());
        //sysLoginUser.setExpireTime(sysLoginUser.getLoginTime() + EXPIRE_TIME * MILLIS_MINUTE);
        //根据uuid将loginUser缓存
        //String userKey = getTokenKey(sysLoginUser.getToken());
        //redisService.setCacheObject(userKey, sysLoginUser, EXPIRE_TIME, TimeUnit.MINUTES);
    }

    private String getTokenKey(String token) {
        return ACCESS_TOKEN + token;
    }
}
