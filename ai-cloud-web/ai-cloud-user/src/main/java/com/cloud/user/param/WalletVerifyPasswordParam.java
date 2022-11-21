package com.cloud.user.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 钱包验证密码参数
 *
 * @author ai-cloud
 */
@Data
@ApiModel("钱包验证密码参数")
public class WalletVerifyPasswordParam {

    @ApiModelProperty(value = "密码", example = "111111", required = true)
    private String password;

}

