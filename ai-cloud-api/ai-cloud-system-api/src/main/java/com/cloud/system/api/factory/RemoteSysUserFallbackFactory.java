package com.cloud.system.api.factory;

import com.cloud.common.domain.R;
import com.cloud.system.api.domain.SysUser;
import com.cloud.system.api.model.SysLoginUser;
import com.cloud.system.api.service.RemoteSysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 用户服务降级处理
 *
 * @author ai-cloud
 */
@Component
public class RemoteSysUserFallbackFactory implements FallbackFactory<RemoteSysUserService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteSysUserFallbackFactory.class);

    @Override
    public RemoteSysUserService create(Throwable throwable) {
        log.error("用户服务调用失败:{}", throwable.getMessage());
        return new RemoteSysUserService() {
            @Override
            public R<SysLoginUser> getSysUserInfo(String username, String source) {
                return R.fail("获取系统用户失败:" + throwable.getMessage());
            }

            @Override
            public R<Boolean> registerUserInfo(SysUser sysUser, String source) {
                return R.fail("注册系统用户失败:" + throwable.getMessage());
            }

        };
    }
}
