package com.cloud.user.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/**
 * 钱包验证密码参数
 *
 * @author ai-cloud
 */
@Data
@Getter
@Setter
@ApiModel("钱包验证密码参数")
public class WalletVerifyPasswordParam {

    @ApiModelProperty(value = "密码", example = "123456", required = true)
    private String password;

}

