package com.cloud.system;


import com.cloud.mybatis.annotation.EnableCustomConfig;
import com.cloud.security.annotation.EnableRyFeignClients;
import com.cloud.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 系统模块
 *
 * @author ai-cloud
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class CloudSystemApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudSystemApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  系统模块启动成功   ლ(´ڡ`ლ)");
    }
}
