package com.cloud.monitor.controller;

import com.cloud.common.constant.CacheConstants;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.web.domain.AjaxResult;
import com.cloud.monitor.domain.SysCache;
import com.cloud.security.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 缓存监控
 *
 * @author ai-cloud
 */
@RestController
@RequestMapping("/cache")
public class CacheController {
    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    private final static List<SysCache> caches = new ArrayList<SysCache>();

    {
        caches.add(new SysCache(CacheConstants.LOGIN_TOKEN_KEY, "用户信息"));
        caches.add(new SysCache(CacheConstants.SYS_CONFIG_KEY, "配置信息"));
        caches.add(new SysCache(CacheConstants.SYS_DICT_KEY, "数据字典"));
        caches.add(new SysCache(CacheConstants.CAPTCHA_CODE_KEY, "验证码"));
        caches.add(new SysCache(CacheConstants.REPEAT_SUBMIT_KEY, "防重提交"));
        caches.add(new SysCache(CacheConstants.RATE_LIMIT_KEY, "限流处理"));
        caches.add(new SysCache(CacheConstants.PWD_ERR_CNT_KEY, "密码错误次数"));
    }

    @RequiresPermissions("monitor:cache:list")
    @GetMapping()
    public AjaxResult getInfo() throws Exception {
        Properties info = (Properties) redisTemplate.execute((RedisCallback<Object>) connection -> connection.info());
        Properties commandStats = (Properties) redisTemplate.execute((RedisCallback<Object>) connection -> connection.info("commandstats"));
        Object dbSize = redisTemplate.execute((RedisCallback<Object>) connection -> connection.dbSize());

        Map<String, Object> result = new HashMap<>(3);
        result.put("info", info);
        result.put("dbSize", dbSize);

        List<Map<String, String>> pieList = new ArrayList<>();
        commandStats.stringPropertyNames().forEach(key -> {
            Map<String, String> data = new HashMap<>(2);
            String property = commandStats.getProperty(key);
            data.put("name", StringUtils.removeStart(key, "cmdstat_"));
            data.put("value", StringUtils.substringBetween(property, "calls=", ",usec"));
            pieList.add(data);
        });
        result.put("commandStats", pieList);
        return AjaxResult.success(result);
    }

    @RequiresPermissions("monitor:cache:list")
    @GetMapping("/getNames")
    public AjaxResult cache() {
        return AjaxResult.success(caches);
    }

    @RequiresPermissions("monitor:cache:list")
    @GetMapping("/getKeys/{cacheName}")
    public AjaxResult getCacheKeys(@PathVariable String cacheName) {
        Set<String> cacheKeys = redisTemplate.keys(cacheName + "*");
        return AjaxResult.success(cacheKeys);
    }

    @RequiresPermissions("monitor:cache:list")
    @GetMapping("/getValue/{cacheName}/{cacheKey}")
    public AjaxResult getCacheValue(@PathVariable String cacheName, @PathVariable String cacheKey) {
        String cacheValue = redisTemplate.opsForValue().get(cacheKey);
        SysCache sysCache = new SysCache(cacheName, cacheKey, cacheValue);
        return AjaxResult.success(sysCache);
    }

    @RequiresPermissions("monitor:cache:list")
    @DeleteMapping("/clearCacheName/{cacheName}")
    public AjaxResult clearCacheName(@PathVariable String cacheName) {
        Collection<String> cacheKeys = redisTemplate.keys(cacheName + "*");
        redisTemplate.delete(cacheKeys);
        return AjaxResult.success();
    }

    @RequiresPermissions("monitor:cache:list")
    @DeleteMapping("/clearCacheKey/{cacheKey}")
    public AjaxResult clearCacheKey(@PathVariable String cacheKey) {
        redisTemplate.delete(cacheKey);
        return AjaxResult.success();
    }

    @RequiresPermissions("monitor:cache:list")
    @DeleteMapping("/clearCacheAll")
    public AjaxResult clearCacheAll() {
        Collection<String> cacheKeys = redisTemplate.keys("*");
        redisTemplate.delete(cacheKeys);
        return AjaxResult.success();
    }
}
