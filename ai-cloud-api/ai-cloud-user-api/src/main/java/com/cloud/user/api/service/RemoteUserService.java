package com.cloud.user.api.service;

import com.cloud.common.constant.LangConstants;
import com.cloud.common.constant.SecurityConstants;
import com.cloud.common.constant.ServiceNameConstants;
import com.cloud.common.domain.R;
import com.cloud.user.api.domain.User;
import com.cloud.user.api.factory.RemoteUserFallbackFactory;
import com.cloud.user.api.model.LoginUser;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

/**
 * 用户服务
 *
 * @author ai-cloud
 */
@FeignClient(contextId = "remoteUserService", value = ServiceNameConstants.USER_SERVICE, fallbackFactory = RemoteUserFallbackFactory.class)
public interface RemoteUserService {

    /**
     * 通过用户名手机号或openId查询用户
     *
     * @param param    用户名手机号或openId
     * @param language 语言类型
     * @param source   请求来源
     * @return 结果
     */
    @GetMapping("/user/info/{param}")
    public R<LoginUser> getUserInfo(@PathVariable("param") String param,
                                    @RequestHeader(LangConstants.LANGUAGE) String language,
                                    @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 注册用户信息
     *
     * @param user     用户信息
     * @param language 语言类型
     * @param source   请求来源
     * @return 结果
     */
    @PostMapping("/user/register")
    public R<Boolean> registerUserInfo(@RequestBody User user,
                                       @RequestHeader(LangConstants.LANGUAGE) String language,
                                       @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

    /**
     * 更新用户信息
     *
     * @param user     用户信息
     * @param language 语言类型
     * @param source   请求来源
     * @return 结果
     */
    @PostMapping("/user/update")
    public R<Integer> updateUserInfo(@RequestBody User user,
                                     @RequestHeader(LangConstants.LANGUAGE) String language,
                                     @RequestHeader(SecurityConstants.FROM_SOURCE) String source);

}
