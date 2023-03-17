package com.cloud.pay;

import com.cloud.mybatis.annotation.EnableCustomConfig;
import com.cloud.security.annotation.EnableRyFeignClients;
import com.cloud.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 支付模块
 *
 * @author ai-cloud
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class CloudPayApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudPayApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  支付模块启动成功   ლ(´ڡ`ლ)");
    }
}
