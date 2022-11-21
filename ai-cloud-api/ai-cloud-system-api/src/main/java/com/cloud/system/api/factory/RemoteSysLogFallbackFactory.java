package com.cloud.system.api.factory;

import com.cloud.common.domain.R;
import com.cloud.system.api.domain.SysLogininfor;
import com.cloud.system.api.domain.SysOperLog;
import com.cloud.system.api.service.RemoteSysLogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 日志服务降级处理
 *
 * @author ai-cloud
 */
@Component
public class RemoteSysLogFallbackFactory implements FallbackFactory<RemoteSysLogService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteSysLogFallbackFactory.class);

    @Override
    public RemoteSysLogService create(Throwable throwable) {
        log.error("日志服务调用失败:{}", throwable.getMessage());
        return new RemoteSysLogService() {
            @Override
            public R<Boolean> saveLog(SysOperLog sysOperLog, String source) {
                return null;
            }

            @Override
            public R<Boolean> saveLogininfor(SysLogininfor sysLogininfor, String source) {
                return null;
            }
        };

    }
}
