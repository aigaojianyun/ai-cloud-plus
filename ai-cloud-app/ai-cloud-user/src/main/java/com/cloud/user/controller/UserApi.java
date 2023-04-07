package com.cloud.user.controller;

import com.cloud.common.constant.LangConstants;
import com.cloud.common.domain.R;
import com.cloud.common.utils.StringUtils;
import com.cloud.i18n.utils.MessageUtils;
import com.cloud.security.annotation.InnerAuth;
import com.cloud.user.api.domain.User;
import com.cloud.user.api.model.LoginUser;
import com.cloud.user.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 用户信息
 *
 * @author ai-cloud
 */
@Api(tags = "用户信息")
@RestController
@RequestMapping("/user")
public class UserApi {

    @Autowired
    private IUserService userService;

    /**
     * 通过用户名或手机号查询用户
     *
     * @param param 用户名/手机号/openId
     * @return 用户对象信息
     */
    @InnerAuth
    @GetMapping("/info/{param}")
    @ApiOperation("通过用户名/手机号/openId查询用户")
    public R<LoginUser> selectByUserInfo(@PathVariable("param") String param,
                                         @RequestHeader(value = LangConstants.LANGUAGE) String language) {
        //用户信息
        User user = userService.selectByUserNamePhoneOpenId(param);
        LoginUser userVo = new LoginUser();
        if (StringUtils.isNotNull(user)) {
            userVo.setUser(user);
        }
        return R.ok(userVo);
    }

    /**
     * 注册用户信息
     *
     * @param user 用户信息
     * @return 用户对象信息
     */
    @InnerAuth
    @PostMapping("register")
    @ApiOperation("注册用户信息")
    public R<Boolean> register(@RequestBody User user,
                               @RequestHeader(value = LangConstants.LANGUAGE) String language) {
        String username = user.getUserName();
        String phone = user.getPhone();
        if (!userService.checkUserNameUnique(user)) {
            return R.fail(MessageUtils.message("user.register") + username + MessageUtils.message("user.register.failure"));
        }
        if (!userService.checkPhoneUnique(user)) {
            return R.fail(MessageUtils.message("user.register") + username + MessageUtils.message("user.register.failure"));
        }
        return R.ok(userService.registerUser(user));
    }

    /**
     * 更新用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @InnerAuth
    @PostMapping("update")
    @ApiOperation("更新用户信息")
    public R<Integer> update(@RequestBody User user,
                             @RequestHeader(value = LangConstants.LANGUAGE) String language) {
        return R.ok(userService.updateUser(user));
    }


}

