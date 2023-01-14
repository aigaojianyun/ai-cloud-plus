package com.cloud.weixin.config;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.api.impl.WxMaServiceImpl;
import cn.binarywang.wx.miniapp.config.WxMaConfig;
import cn.binarywang.wx.miniapp.config.impl.WxMaDefaultConfigImpl;
import com.cloud.weixin.config.properties.WeiXinProperties;
import com.github.binarywang.wxpay.config.WxPayConfig;
import com.github.binarywang.wxpay.service.WxPayService;
import com.github.binarywang.wxpay.service.impl.WxPayServiceImpl;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * wxauth  configuration.
 *
 * @author ai-cloud
 */

@Configuration
@ConditionalOnClass(WxPayService.class) //引入WxPayService这个类 下面两个才会实例化
@EnableConfigurationProperties(WeiXinProperties.class) //注入WxPayProperties类
@RequiredArgsConstructor
public class WeiXinConfiguration {

    @Autowired
    private WeiXinProperties properties;

    /**
     * 获取小程序WxMaService
     *
     * @return
     */
    @Bean
    @ConditionalOnMissingBean
    public WxMaService wxMaService() {
        //实例这个 WxMaConfig
        WxMaConfig wxMaConfig = new WxMaDefaultConfigImpl();
        ((WxMaDefaultConfigImpl) wxMaConfig).setAppid(StringUtils.trimToNull(this.properties.getAppId()));
        ((WxMaDefaultConfigImpl) wxMaConfig).setSecret(StringUtils.trimToNull(this.properties.getAppSecret()));
        WxMaService wxMaService = new WxMaServiceImpl();
        //设置配置文件
        wxMaService.setWxMaConfig(wxMaConfig);
        return wxMaService;
    }

    /**
     * 获取小程序WxPayService
     *
     * @return
     */
    @Bean
    @ConditionalOnMissingBean
    public WxPayService wxPayService() {

        //实例payConfig 设置固定参数
        WxPayConfig payConfig = new WxPayConfig();
        payConfig.setAppId(StringUtils.trimToNull(this.properties.getAppId()));
        payConfig.setMchId(StringUtils.trimToNull(this.properties.getMchId()));
        payConfig.setMchKey(StringUtils.trimToNull(this.properties.getMchKey()));
        // payConfig.setSubAppId(StringUtils.trimToNull(this.properties.getSubAppId()));
        // payConfig.setSubMchId(StringUtils.trimToNull(this.properties.getSubMchId()));
        payConfig.setKeyPath(StringUtils.trimToNull(this.properties.getKeyPath()));

        // 可以指定是否使用沙箱环境
        payConfig.setUseSandboxEnv(false);

        WxPayService wxPayService = new WxPayServiceImpl();
        wxPayService.setConfig(payConfig);
        return wxPayService;
    }


}
