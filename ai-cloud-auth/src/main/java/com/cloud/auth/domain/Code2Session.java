package com.cloud.auth.domain;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * code换取openId
 * https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/login/auth.code2Session.html
 *
 * @author ai-cloud
 */
@Data
@Accessors(chain = true)
public class Code2Session {

    @ApiModelProperty(value = "openId", example = "openId")
    private String openId;

    @ApiModelProperty(value = "sessionKey", example = "sessionKey")
    private String sessionKey;

    @ApiModelProperty(value = "unionId", example = "unionId")
    private String unionId;

    @ApiModelProperty(value = "错误码", example = "40001")
    private Integer errCode;

    @ApiModelProperty(value = "错误信息", example = "AppSecret 错误或者 AppSecret 不属于这个小程序，请开发者确认 AppSecret 的正确性")
    private String errMsg;
}
