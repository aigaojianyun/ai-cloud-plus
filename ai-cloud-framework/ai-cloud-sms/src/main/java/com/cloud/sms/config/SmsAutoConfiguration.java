package com.cloud.sms.config;


import com.cloud.sms.config.properties.SmsProperties;
import com.cloud.sms.service.SmsTemplate;
import com.cloud.sms.service.impl.AliyunSmsTemplate;
import com.cloud.sms.service.impl.TencentSmsTemplate;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 短信配置类
 *
 * @author ai-cloud
 */

@AutoConfiguration
@EnableConfigurationProperties(SmsProperties.class)
public class SmsAutoConfiguration {

    @Configuration
    @ConditionalOnProperty(value = "sms.enabled", havingValue = "false")
    @ConditionalOnClass(com.aliyun.dysmsapi20170525.Client.class)
    public static class AliyunSmsConfiguration {
        @Bean
        public SmsTemplate aliyunSmsTemplate(SmsProperties smsProperties) {
            return new AliyunSmsTemplate(smsProperties);
        }
    }

    @Configuration
    @ConditionalOnProperty(value = "sms.enabled", havingValue = "true")
    @ConditionalOnClass(com.tencentcloudapi.sms.v20190711.SmsClient.class)
    public static class TencentSmsConfiguration {
        @Bean
        public SmsTemplate tencentSmsTemplate(SmsProperties smsProperties) {
            return new TencentSmsTemplate(smsProperties);
        }
    }

}
