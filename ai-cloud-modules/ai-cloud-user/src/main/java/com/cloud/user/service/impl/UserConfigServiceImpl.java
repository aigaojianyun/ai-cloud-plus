package com.cloud.user.service.impl;

import com.cloud.auth.api.domain.UserConfig;
import com.cloud.common.constant.Constants;
import com.cloud.redis.service.RedisService;
import com.cloud.common.text.Convert;
import com.cloud.common.utils.StringUtils;
import com.cloud.user.mapper.UserConfigMapper;
import com.cloud.user.service.IUserConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 参数配置Service业务层处理
 *
 * @author ai-cloud
 */
@Service
public class UserConfigServiceImpl implements IUserConfigService {

    @Autowired
    private UserConfigMapper userConfigMapper;

    @Autowired
    private RedisService redisService;

    /**
     * 根据键名查询参数配置信息
     *
     * @param configKey 参数key
     * @return 参数键值
     */
    @Override
    public String selectByConfigKey(String configKey) {
        String configValue = Convert.toStr(redisService.getCacheObject(getCacheKey(configKey)));
        if (StringUtils.isNotEmpty(configValue)) {
            return configValue;
        }
        UserConfig userConfig = new UserConfig();
        userConfig.setConfigKey(configKey);
        UserConfig retConfig = userConfigMapper.selectByConfig(userConfig);
        if (StringUtils.isNotNull(retConfig)) {
            redisService.setCacheObject(getCacheKey(configKey), retConfig.getConfigValue());
            return retConfig.getConfigValue();
        }
        return StringUtils.EMPTY;
    }

    /**
     * 设置cache key
     *
     * @param configKey 参数键
     * @return 缓存键key
     */
    private String getCacheKey(String configKey) {
        return Constants.SYS_CONFIG_KEY + configKey;
    }
}
