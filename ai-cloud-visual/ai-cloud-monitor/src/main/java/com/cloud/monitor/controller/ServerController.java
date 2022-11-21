package com.cloud.monitor.controller;

import com.cloud.common.web.domain.AjaxResult;
import com.cloud.monitor.service.Server;
import com.cloud.security.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 服务器监控
 *
 * @author ai-cloud
 */
@RestController
@RequestMapping("/server")
public class ServerController {

    @RequiresPermissions("monitor:server:list")
    @GetMapping()
    public AjaxResult getInfo() throws Exception {
        Server server = new Server();
        server.copyTo();
        return AjaxResult.success(server);
    }

}
