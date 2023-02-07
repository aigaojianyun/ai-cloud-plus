package com.cloud.weixin.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * wxmp  properties.
 *
 * @author ai-cloud
 */
@Data
@ConfigurationProperties(prefix = "wx.mp")
public class WechatMpProperties {

    /**
     * 公众号appId
     */
    private String mpAppId;

    /**
     * 公众号应用密钥
     */
    private String mpAppSecret;

}
