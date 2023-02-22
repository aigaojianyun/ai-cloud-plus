package com.cloud.job;

import com.cloud.mybatis.annotation.EnableCustomConfig;
import com.cloud.security.annotation.EnableRyFeignClients;
import com.cloud.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 定时任务
 *
 * @author ai-cloud
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class CloudJobApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudJobApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  定时任务模块启动成功   ლ(´ڡ`ლ)");
    }
}
