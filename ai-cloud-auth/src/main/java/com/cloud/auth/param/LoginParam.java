package com.cloud.auth.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 用户登录对象
 *
 * @author ai-cloud
 */
@Data
@ApiModel("账号密码登录参数")
public class LoginParam extends BaseParam {

    @ApiModelProperty(value = "用户账号或手机号", example = "13888888888")
    private String username;

    @ApiModelProperty(value = "用户密码", example = "123456")
    private String password;

    @ApiModelProperty(value = "验证码", example = "123456")
    private String code;

}
