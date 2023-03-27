package com.cloud.auth.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 用户注册对象
 *
 * @author ai-cloud
 */
@Data
@ApiModel("用户注册参数")
public class RegisterParam extends LoginParam {

    @ApiModelProperty(value = "用户手机号", example = "13888888888")
    private String phone;

    @ApiModelProperty(value = "注册方式；1：手机快捷注册 2：手机短信注册 3：微信注册 4：支付宝注册 5：新浪微博注册", example = "1")
    private Integer regType;

}
