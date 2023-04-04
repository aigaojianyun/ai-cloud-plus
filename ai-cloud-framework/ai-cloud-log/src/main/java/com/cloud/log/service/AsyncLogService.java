package com.cloud.log.service;

import com.cloud.common.constant.SecurityConstants;
import com.cloud.system.api.domain.SysOperLog;
import com.cloud.system.api.service.RemoteSysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * 异步调用日志服务
 *
 * @author ai-cloud
 */
@Service
public class AsyncLogService {
    @Autowired
    private RemoteSysLogService remoteSysLogService;

    /**
     * 保存系统日志记录
     */
    @Async
    public void saveSysLog(SysOperLog sysOperLog) throws Exception {
        remoteSysLogService.saveLog(sysOperLog, SecurityConstants.INNER);
    }
}
