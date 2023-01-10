package com.cloud.system.api.service;

import com.cloud.common.constant.SecurityConstants;
import com.cloud.common.constant.ServiceNameConstants;
import com.cloud.common.domain.R;
import com.cloud.system.api.domain.SysUser;
import com.cloud.system.api.factory.RemoteSysUserFallbackFactory;
import com.cloud.system.api.model.SysLoginUser;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

/**
 * 用户服务
 *
 * @author ai-cloud
 */
@FeignClient(contextId = "remoteSysUserService", value = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteSysUserFallbackFactory.class)
public interface RemoteSysUserService {
    /**
     * 通过用户名查询用户信息
     *
     * @param username 用户名或手机号
     * @param source   请求来源
     * @return 结果
     */
    @GetMapping("/user/info/{username}")
    public R<SysLoginUser> getSysUserInfo(@PathVariable("username") String username, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 注册系统用户信息
     *
     * @param sysUser 用户信息
     * @param source  请求来源
     * @return 结果
     */
    @PostMapping("/user/register")
    public R<Boolean> registerUserInfo(@RequestBody SysUser sysUser, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);


}
