package com.cloud.auth.controller;

import com.alibaba.fastjson.JSONObject;
import com.cloud.auth.param.LoginParam;
import com.cloud.auth.param.WeiXinLoginParam;
import com.cloud.auth.service.LoginService;
import com.cloud.common.domain.R;
import com.cloud.common.utils.AuthUtils;
import com.cloud.common.utils.JwtUtils;
import com.cloud.common.utils.ServletUtils;
import com.cloud.common.utils.sign.RsaUtils;
import com.cloud.security.auth.AuthUtil;
import com.cloud.security.service.WebTokenService;
import com.cloud.security.utils.SecurityUtils;
import com.cloud.user.api.model.LoginUser;
import io.swagger.annotations.Api;
import me.zhyd.oauth.cache.AuthStateCache;
import me.zhyd.oauth.request.AuthRequest;
import me.zhyd.oauth.utils.AuthStateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * token 控制
 *
 * @author ai-cloud
 */
@Api(tags = "登录接口")
@RestController
@RequestMapping("/web")
public class LoginController {

    private final static Map<String, String> auths = new HashMap<String, String>();
    private AuthStateCache authStateCache;
    @Autowired
    private WebTokenService webTokenService;
    @Autowired
    private LoginService loginService;

    /**
     * 账号密码登录
     *
     * @param param 登录参数
     * @return 登录结果
     */
    @PostMapping("/login")
    public R<?> login(@RequestBody LoginParam param) throws Exception {
        // 用户登录
        LoginUser userInfo = loginService.login(param.getUsername(), RsaUtils.decryptByPrivateKey(param.getPassword()), param.getCode(), param.getUuid());
        // 获取登录token
        return R.ok(webTokenService.createToken(userInfo));
    }

    /**
     * 用户微信授权登录
     *
     * @param param 登录参数
     * @return 登录结果
     */
    @PostMapping("/login/wx")
    public R<?> weiXinLogin(@RequestBody WeiXinLoginParam param) throws Exception {
        // 用户登录
        LoginUser userInfo = loginService.loginWx(param);
        // 获取登录token
        return R.ok(webTokenService.createToken(userInfo));
    }

    /**
     * 第三方认证授权登录
     *
     * @param source
     * @throws IOException
     */
    @PostMapping("/login/{source}")
    public void renderAuth(@PathVariable("source") String source) throws IOException {
        String obj = auths.get(source);
        if (StringUtils.isEmpty(obj)) {
            return;
        }
        JSONObject json = JSONObject.parseObject(obj);
        AuthRequest authRequest = AuthUtils.getAuthRequest(source, json.getString("clientId"), json.getString("clientSecret"), json.getString("redirectUri"), authStateCache);
        String authorizeUrl = authRequest.authorize(AuthStateUtils.createState());
        ServletUtils.getResponse().sendRedirect(authorizeUrl);
    }

    /**
     * 刷新令牌有效期
     *
     * @param request 请求对象
     * @return 结果
     */
    @PostMapping("refresh")
    public R<?> refresh(HttpServletRequest request) {
        LoginUser loginUser = webTokenService.getLoginUser(request);
        if (com.cloud.common.utils.StringUtils.isNotNull(loginUser)) {
            // 刷新令牌有效期
            webTokenService.refreshToken(loginUser);
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
        if (com.cloud.common.utils.StringUtils.isNotEmpty(token)) {
            String username = JwtUtils.getUserName(token);
            // 删除用户缓存记录
            AuthUtil.logoutByToken(token);
            // 记录用户退出日志
            loginService.logout(username);
        }
        return R.ok();
    }

}
