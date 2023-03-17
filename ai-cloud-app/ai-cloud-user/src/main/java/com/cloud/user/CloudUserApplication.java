package com.cloud.user;

import com.cloud.mybatis.annotation.EnableCustomConfig;
import com.cloud.security.annotation.EnableRyFeignClients;
import com.cloud.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 用户模块
 *
 * @author ai-cloud
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class CloudUserApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudUserApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  用户模块启动成功   ლ(´ڡ`ლ)");
    }
}
