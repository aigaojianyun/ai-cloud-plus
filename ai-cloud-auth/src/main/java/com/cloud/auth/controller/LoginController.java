package com.cloud.auth.controller;

import com.cloud.auth.param.WeiXinLoginParam;
import com.cloud.auth.service.LoginService;
import com.cloud.common.domain.R;
import com.cloud.security.service.TokenService;
import com.cloud.user.api.model.LoginUser;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * token 控制
 *
 * @author ai-cloud
 */
@Api(tags = "登录接口")
@RestController
public class LoginController {

    @Autowired
    private TokenService tokenService;

    @Autowired
    private LoginService loginService;

    /**
     * 用户微信授权登录
     *
     * @param param 登录参数
     * @return 登录结果
     */
    @PostMapping("login/wx")
    public R<?> weiXinLogin(@RequestBody WeiXinLoginParam param) throws Exception {
        // 用户登录
        LoginUser userInfo = loginService.loginWx(param);
        // 获取登录token
        return R.ok();
    }

}
