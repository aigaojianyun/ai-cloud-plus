package com.cloud.market;

import com.cloud.mybatis.annotation.EnableCustomConfig;
import com.cloud.security.annotation.EnableRyFeignClients;
import com.cloud.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 行情模块
 *
 * @author ai-cloud
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class CloudMarketApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudMarketApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  行情模块启动成功   ლ(´ڡ`ლ)");
    }
}
