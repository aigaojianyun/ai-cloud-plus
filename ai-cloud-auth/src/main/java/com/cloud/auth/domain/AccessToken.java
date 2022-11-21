package com.cloud.auth.domain;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 接口调用凭证
 * https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/access-token/auth.getAccessToken.html
 *
 * @author ai-cloud
 */
@Data
@Accessors(chain = true)
public class AccessToken {

    @ApiModelProperty(value = "accessToken", example = "token")
    private String accessToken;

    @ApiModelProperty(value = "凭证有效时间，单位：秒。目前是7200秒之内的值", example = "7200")
    private Integer expiresIn;

    @ApiModelProperty(value = "错误码", example = "40001")
    private Integer errCode;

    @ApiModelProperty(value = "错误信息", example = "AppSecret 错误或者 AppSecret 不属于这个小程序，请开发者确认 AppSecret 的正确性")
    private String errMsg;
}
