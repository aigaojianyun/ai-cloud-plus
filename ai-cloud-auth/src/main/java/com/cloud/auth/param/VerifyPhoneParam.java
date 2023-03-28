package com.cloud.auth.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
/**
 * 一键登录请求参数
 *
 * @author ai-cloud
 */

@Data
@ApiModel("一键登录请求参数")
public class VerifyPhoneParam extends BaseParam{

    @ApiModelProperty(value = "客户端的token", example = "e1e4c24876514fc999d043ae0f496752")
    private String token;

    @ApiModelProperty(value = "客户端返回的运营商token", example = "e1e4c24876514fc999d043ae0f496752")
    private String opToken;

    @ApiModelProperty(value = "客户端返回的运营商，CMCC:中国移动通信, CUCC:中国联通通讯, CTCC:中国电信", example = "CMCC")
    private String operator;

    @ApiModelProperty(value = "android必须要填写", example = "e4caa1a08ba0570b5c1290b1a0bc9252")
    private String md5;

}
