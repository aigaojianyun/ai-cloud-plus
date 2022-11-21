package com.cloud.resource;

import com.cloud.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 资源服务
 *
 * @author ai-cloud
 */
@EnableCustomSwagger2
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class CloudResourceApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudResourceApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  资源服务模块启动成功   ლ(´ڡ`ლ)");
    }
}
