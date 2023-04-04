package com.cloud.security.config;

import com.cloud.security.interceptor.HeaderInterceptor;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * 拦截器配置
 *
 * @author ai-cloud
 */
public class WebMvcConfig implements WebMvcConfigurer {
    /**
     * 不需要拦截地址
     */
    public static final String[] EXCLUDE_URLS = {"/login", "/logout", "/refresh"};

    /**
     *  添加拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LocaleInterceptor());
        registry.addInterceptor(getHeaderInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(EXCLUDE_URLS)
                .order(-10);
    }

    /**
     * Locale拦截器，用来根据Language参数设置Locale
     */
    public class LocaleInterceptor extends HandlerInterceptorAdapter {

        // 在处理请求之前执行
        @Override
        public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
            // 获取Language参数
            String lang = request.getHeader("Language");
            if (lang != null && !lang.isEmpty()) {
                // 解析Language参数，生成对应的Locale对象
                Locale locale = Locale.forLanguageTag(lang);
                // 将Locale设置到LocaleContextHolder中
                LocaleContextHolder.setLocale(locale);
            }
            return true;
        }
    }

    /**
     * 自定义请求头拦截器
     */
    public HeaderInterceptor getHeaderInterceptor() {
        return new HeaderInterceptor();
    }
}
