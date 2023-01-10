package com.cloud.auth.controller;

import com.cloud.auth.param.LoginParam;
import com.cloud.auth.param.RegisterParam;
import com.cloud.auth.service.SysLoginService;
import com.cloud.common.domain.R;
import com.cloud.common.utils.JwtUtils;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.utils.sign.RsaUtils;
import com.cloud.security.auth.AuthUtil;
import com.cloud.security.service.TokenService;
import com.cloud.security.utils.SecurityUtils;
import com.cloud.system.api.model.SysLoginUser;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * token 控制
 *
 * @author ai-cloud
 */
@Api(tags = "登录接口")
@RestController
public class SysLoginController {
    @Autowired
    private TokenService tokenService;

    @Autowired
    private SysLoginService sysLoginService;

    /**
     * 账号密码登录
     *
     * @param param 登录参数
     * @return 登录结果
     */
    @PostMapping("login")
    public R<?> login(@RequestBody LoginParam param) throws Exception {
        // 用户登录
        SysLoginUser userInfo = sysLoginService.login(param.getUsername(), RsaUtils.decryptByPrivateKey(param.getPassword()), param.getCode(), param.getUuid());
        // 获取登录token
        return R.ok(tokenService.createToken(userInfo));
    }

    /**
     * 账号密码注册
     *
     * @param param 注册参数
     * @return 注册结果
     */
    @PostMapping("register")
    public R<?> register(@RequestBody RegisterParam param) {
        // 用户注册
        sysLoginService.register(param.getUsername(), param.getPassword());
        return R.ok();
    }

    /**
     * 刷新令牌有效期
     *
     * @param request 请求对象
     * @return 结果
     */
    @PostMapping("refresh")
    public R<?> refresh(HttpServletRequest request) {
        SysLoginUser sysLoginUser = tokenService.getLoginUser(request);
        if (StringUtils.isNotNull(sysLoginUser)) {
            // 刷新令牌有效期
            tokenService.refreshToken(sysLoginUser);
            return R.ok();
        }
        return R.ok();
    }

    /**
     * 退出登录
     *
     * @param request 请求对象
     * @return 结果
     */
    @DeleteMapping("logout")
    public R<?> logout(HttpServletRequest request) {
        String token = SecurityUtils.getToken(request);
        if (StringUtils.isNotEmpty(token)) {
            String username = JwtUtils.getUserName(token);
            // 删除用户缓存记录
            AuthUtil.logoutByToken(token);
            // 记录用户退出日志
            sysLoginService.logout(username);
        }
        return R.ok();
    }


}
