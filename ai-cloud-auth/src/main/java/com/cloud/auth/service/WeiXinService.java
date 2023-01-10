package com.cloud.auth.service;

import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSONObject;
import com.cloud.auth.config.properties.WxPayProperties;
import com.cloud.auth.domain.AccessToken;
import com.cloud.auth.domain.Code2Session;
import com.cloud.auth.service.WeiXinService;
import com.github.binarywang.wxpay.service.WxPayService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * 接口调用实现
 *
 * @author ai-cloud
 */
@Service
public class WeiXinService {

    @Autowired
    private WxPayService wxPayService;
    @Autowired
    private WxPayProperties wxPayProperties;

    /**
     * code换取openId
     * https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/login/auth.code2Session.html
     *
     * @param code
     * @return
     */
    public Code2Session codeSession(String code) {
        String url = "https://api.weixin.qq.com/sns/jscode2session?" + "appid=" + wxPayProperties.getAppId() + "&secret=" + wxPayProperties.getAppSecret() + "&js_code=" + code + "&grant_type=authorization_code";
        String result = HttpUtil.get(url);
        JSONObject jsonObject = JSONObject.parseObject(result);
        Code2Session code2Session = new Code2Session().setOpenId(jsonObject.getString("openid"))
                .setSessionKey(jsonObject.getString("session_key"))
                .setUnionId(jsonObject.getString("unionid"))
                .setErrCode(jsonObject.getInteger("errcode"))
                .setErrMsg(jsonObject.getString("errmsg"));
        if (StringUtils.isEmpty(code2Session.getOpenId())) {
            code2Session.setErrMsg("OpenId为空");
        } else if (Objects.equals(code2Session.getErrCode(), -1)) {
            code2Session.setErrMsg("系统繁忙，此时请开发者稍候再试");
        } else if (Objects.equals(code2Session.getErrCode(), 40029)) {
            code2Session.setErrMsg("code 无效");
        } else if (Objects.equals(code2Session.getErrCode(), 45011)) {
            code2Session.setErrMsg("频率限制，每个用户每分钟100次");
        } else {
            code2Session.setErrMsg("其他错误");
        }
        return code2Session;
    }

    /**
     * 接口调用凭据
     * https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/access-token/auth.getAccessToken.html
     *
     * @return
     */
    public AccessToken getAccessToken() {
        String url = "https://api.weixin.qq.com/cgi-bin/token?" + "grant_type=client_credential" + "&appid=" + wxPayProperties.getAppId() + "&secret=" + wxPayProperties.getAppSecret();
        String result = HttpUtil.get(url);
        JSONObject jsonObject = JSONObject.parseObject(result);
        AccessToken accessToken = new AccessToken().setAccessToken(jsonObject.getString("access_token"))
                .setExpiresIn(jsonObject.getInteger("expires_in"))
                .setErrCode(jsonObject.getInteger("errcode"))
                .setErrMsg(jsonObject.getString("errmsg"));
        if (StringUtils.isEmpty(accessToken.getAccessToken())) {
        } else if ( Objects.equals(accessToken.getErrCode(), -1)) {
            accessToken.setErrMsg("系统繁忙，此时请开发者稍候再试");
        } else if (Objects.equals(accessToken.getErrCode(), 40001)) {
            accessToken.setErrMsg("AppSecret 错误或者 AppSecret 不属于这个小程序，请开发者确认 AppSecret 的正确性");
        } else if (Objects.equals(accessToken.getErrCode(), 40002)) {
            accessToken.setErrMsg("请确保 grant_type 字段值为 client_credential");
        } else if (Objects.equals(accessToken.getErrCode(), 40013)) {
            accessToken.setErrMsg("不合法的 AppID，请开发者检查 AppID 的正确性，避免异常字符，注意大小写");
        } else {
            accessToken.setErrMsg("其他错误");
        }
        return accessToken;
    }
}
