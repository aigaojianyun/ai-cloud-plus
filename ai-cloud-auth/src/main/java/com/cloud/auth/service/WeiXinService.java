package com.cloud.auth.service;

import com.cloud.auth.domain.AccessToken;
import com.cloud.auth.domain.Code2Session;

/**
 * 接口调用
 *
 * @author ai-cloud
 */
public interface WeiXinService {

    /**
     * code换取openId
     * https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/login/auth.code2Session.html
     *
     * @param code
     * @return
     */
   public Code2Session codeSession(String code);

    /**
     * 接口调用凭据
     * https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/access-token/auth.getAccessToken.html
     *
     * @return
     */
   public AccessToken getAccessToken();

}
