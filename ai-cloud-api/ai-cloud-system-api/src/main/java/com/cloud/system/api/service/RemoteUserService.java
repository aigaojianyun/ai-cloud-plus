package com.cloud.system.api.service;

import com.cloud.common.constant.SecurityConstants;
import com.cloud.common.constant.ServiceNameConstants;
import com.cloud.common.domain.R;
import com.cloud.system.api.domain.User;
import com.cloud.system.api.factory.RemoteUserFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

/**
 * 用户服务
 *
 * @author ai-cloud
 */
@FeignClient(contextId = "remoteUserService", value = ServiceNameConstants.USER_SERVICE, fallbackFactory = RemoteUserFallbackFactory.class)
public interface RemoteUserService {


    /**
     * 通过openId查询用户
     *
     * @param openid openid
     * @param source 请求来源
     * @return 结果
     */
    @PostMapping("user/info/{openid}")
    public R<User> getOpenIdUserInfo(@PathVariable("openid") String openid, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 注册用户信息
     *
     * @param user   用户信息
     * @param source 请求来源
     * @return 结果
     */
    @PostMapping("/user/register")
    public R<Boolean> registerUserInfo(@RequestBody User user, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 更新用户信息
     *
     * @param user   用户信息
     * @param source 请求来源
     * @return 结果
     */
    @PostMapping("/user/update")
    public R<Boolean> updateUserInfo(@RequestBody User user, @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

}
