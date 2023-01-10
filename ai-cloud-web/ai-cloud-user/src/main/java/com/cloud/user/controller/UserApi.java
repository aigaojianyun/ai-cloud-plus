package com.cloud.user.controller;

import com.cloud.common.constant.UserConstants;
import com.cloud.common.domain.R;
import com.cloud.common.utils.StringUtils;
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
     * @param param 用户名或手机号
     * @return 用户对象信息
     */
    @InnerAuth
    @PostMapping("/info/{param}")
    @ApiOperation("通过openId查询用户")
    public R<LoginUser> openId(@PathVariable("param") String param) {
        //用户信息
        User user = userService.selectByUserNamePhone(param);
        LoginUser userVo = new LoginUser();
        if (StringUtils.isNotNull(user)) {
            userVo.setUser(user);
        }
        return R.ok(userVo);
    }

    /**
     * 通过openId查询用户
     *
     * @param openid openid
     * @return 用户对象信息
     */
    @InnerAuth
    @PostMapping("/info/{openid}")
    @ApiOperation("通过openId查询用户")
    public R<User> selectByOpenId(@PathVariable("openid") String openid) {
        return R.ok(userService.selectByOpenId(openid));
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
    public R<Boolean> register(@RequestBody User user) {
        String username = user.getUserName();
        String phone = user.getPhone();
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(username))) {
            return R.fail("注册用户'" + username + "'失败，账号已存在");
        }
        if (UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
            return R.fail("注册用户'" + phone + "'失败，手机号已存在");
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
    public R<Boolean> update(@RequestBody User user) {
        return R.ok(userService.updateUser(user));
    }


}

