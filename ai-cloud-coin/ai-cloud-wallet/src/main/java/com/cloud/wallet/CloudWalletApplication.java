package com.cloud.wallet;

import com.cloud.security.annotation.EnableCustomConfig;
import com.cloud.security.annotation.EnableRyFeignClients;
import com.cloud.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 钱包模块
 *
 * @author ai-cloud
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class CloudWalletApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudWalletApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  钱包模块启动成功   ლ(´ڡ`ლ)");
    }
}
