package com.cloud.monitor;

import com.cloud.security.annotation.EnableRyFeignClients;
import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 监控中心
 *
 * @author ai-cloud
 */
@EnableAdminServer
@EnableRyFeignClients
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class CloudMonitorApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudMonitorApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  监控中心启动成功   ლ(´ڡ`ლ)");
    }
}
