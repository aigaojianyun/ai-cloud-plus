package com.cloud.i18n.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

/**
 * 国际化配置
 *
 * @author ai-cloud
 */
@Configuration
public class I18nConfig {

    /**
     * 配置消息源
     */
    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        // 设置消息资源文件的基础名称
        messageSource.setBasename("classpath:i18n/messages");
        // 设置消息缓存时间（单位：秒），默认值为-1，表示不使用缓存
        messageSource.setCacheSeconds(3600);
        // 设置默认编码
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }

    /**
     * 配置区域拦截器
     */
    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor localeInterceptor = new LocaleChangeInterceptor();
        // 设置拦截器参数名称
        localeInterceptor.setParamName("lang");
        return localeInterceptor;
    }

    /**
     * 配置消息源访问器
     */
    @Bean
    public MessageSourceAccessor messageSourceAccessor(MessageSource messageSource) {
        return new MessageSourceAccessor(messageSource);
    }

    /**
     * 配置消息解析器
     */
    @Bean
    public LocalValidatorFactoryBean validator(MessageSource messageSource) {
        LocalValidatorFactoryBean validatorFactoryBean = new LocalValidatorFactoryBean();
        validatorFactoryBean.setValidationMessageSource(messageSource);
        return validatorFactoryBean;
    }


    /**
     * 配置拦截器
     */
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
    }

}
