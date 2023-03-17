package com.cloud.user.param;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 账单请求参数
 *
 * @author ai-cloud
 */
@Data
@ApiModel("账单明细请求参数")
public class WalletBillDetailParam {

    @ApiModelProperty(value = "账单id", example = "1572507674044665856")
    private String detailId;

}
