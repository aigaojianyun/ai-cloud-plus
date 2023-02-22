package com.cloud.gen;

import com.cloud.mybatis.annotation.EnableCustomConfig;
import com.cloud.security.annotation.EnableRyFeignClients;
import com.cloud.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 代码生成
 *
 * @author ai-cloud
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class CloudGenApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudGenApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  代码生成模块启动成功   ლ(´ڡ`ლ)");
    }
}
