package com.cloud.auth.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 微信登录
 *
 * @author ai-cloud
 */
@Data
@ApiModel("微信授权登录请求参数")
public class WeiXinLoginParam extends BaseParam {

    @ApiModelProperty(value = "code", example = "dac071e4f2604729ac676ed4c782dc8d")
    private String code;

    @ApiModelProperty(value = "手机号", example = "13800138000")
    private String encryptedData;

    @ApiModelProperty(value = "iv", example = "iv")
    private String iv;

    @ApiModelProperty(value = "微信用户昵称", example = "小可爱")
    private String nickName;

    @ApiModelProperty(value = "微信用户头像", example = "http")
    private String avatarUrl;

    @ApiModelProperty(value = "性别 0：未知、1：男、2：女", example = "1")
    private Integer gender;

}
