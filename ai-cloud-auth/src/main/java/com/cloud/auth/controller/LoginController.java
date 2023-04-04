package com.cloud.auth.controller;

import com.cloud.auth.param.LoginParam;
import com.cloud.auth.param.VerifyCodeParam;
import com.cloud.auth.param.VerifyPhoneParam;
import com.cloud.auth.param.WeiXinLoginParam;
import com.cloud.auth.service.LoginService;
import com.cloud.common.constant.LangConstants;
import com.cloud.common.domain.R;
import com.cloud.common.utils.JwtUtils;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.utils.sign.RsaUtils;
import com.cloud.security.auth.AuthUtil;
import com.cloud.security.service.WebTokenService;
import com.cloud.security.utils.SecurityUtils;
import com.cloud.user.api.model.LoginUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * token 控制
 *
 * @author ai-cloud
 */
@Api(tags = "移动端登录接口")
@RestController
@RequestMapping("/app")
public class LoginController {

    @Autowired
    private WebTokenService webTokenService;
    @Autowired
    private LoginService loginService;

    /**
     * 账号密码登录
     *
     * @param param    登录参数
     * @param language 语言类型
     * @return 登录结果
     */
    @PostMapping("/login")
    @ApiOperation(value = "账号密码登录", notes = "账号密码登录")
    public R<?> login(@RequestBody LoginParam param,
                      @RequestHeader(value = LangConstants.LANGUAGE, required = true)
                      @ApiParam(value = "语言类型", example = "zh-CN") String language) throws Exception {
        // 校验用户信息
        LoginUser userInfo = loginService.login(param.getUsername(), RsaUtils.decryptByPrivateKey(param.getPassword()), param.getCode(), param.getUuid(), language);
        // 登录
        // SaTokenUtil.login(userInfo);
        // 获取登录token
        // SaTokenInfo token = StpUtil.getTokenInfo();
        return R.ok(webTokenService.createToken(userInfo));
    }

    /**
     * 验证码登录
     *
     * @param param    登录参数
     * @param language 语言类型
     * @return 登录结果
     */
    @PostMapping("/login/phone")
    @ApiOperation(value = "验证码登录", notes = "验证码登录")
    public R<?> loginPhone(@RequestBody VerifyCodeParam param,
                             @RequestHeader(value = LangConstants.LANGUAGE, required = true)
                             @ApiParam(value = "语言类型", example = "zh-CN") String language) {
        // 用户登录
        LoginUser userInfo = loginService.loginPhone(param, language);
        // 获取登录token
        return R.ok(webTokenService.createToken(userInfo));
    }

    /**
     * 一键登录
     *
     * @param param    登录参数
     * @param language 语言类型
     * @return 登录结果
     */
    @PostMapping("/login/ones/tep")
    @ApiOperation(value = "手机一键登录", notes = "一键登录")
    public R<?> loginOnesTep(@RequestBody VerifyPhoneParam param,
                               @RequestHeader(value = LangConstants.LANGUAGE, required = true)
                               @ApiParam(value = "语言类型", example = "zh-CN") String language) {
        // 用户登录
        LoginUser userInfo = loginService.loginOnesTep(param, language);
        // 获取登录token
        return R.ok(webTokenService.createToken(userInfo));
    }

    /**
     * 微信授权登录
     *
     * @param param    登录参数
     * @param language 语言类型
     * @return 登录结果
     */
    @PostMapping("/login/wx")
    @ApiOperation(value = "微信授权登录", notes = "微信授权登录")
    public R<?> loginWeiXin(@RequestBody WeiXinLoginParam param,
                            @RequestHeader(value = LangConstants.LANGUAGE, required = true)

                            @ApiParam(value = "语言类型", example = "zh-CN") String language) throws Exception {
        // 用户登录
        LoginUser userInfo = loginService.loginWeiXin(param, language);
        // 获取登录token
        return R.ok(webTokenService.createToken(userInfo));
    }

    /**
     * 刷新令牌有效期
     *
     * @param request 请求对象
     * @return 结果
     */
    @PostMapping("refresh")
    @ApiOperation(value = "刷新令牌有效期", notes = "刷新令牌有效期")
    public R<?> refresh(HttpServletRequest request) {
        LoginUser loginUser = webTokenService.getLoginUser(request);
        if (StringUtils.isNotNull(loginUser)) {
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
    @ApiOperation(value = "退出登录", notes = "退出登录")
    public R<?> logout(HttpServletRequest request) {
        String token = SecurityUtils.getToken(request);
        if (StringUtils.isNotEmpty(token)) {
            String username = JwtUtils.getUserName(token);
            // 删除用户缓存记录
            AuthUtil.logoutByToken(token);
            // 记录用户退出日志
            loginService.logout(username);
        }
        return R.ok();
    }

}
