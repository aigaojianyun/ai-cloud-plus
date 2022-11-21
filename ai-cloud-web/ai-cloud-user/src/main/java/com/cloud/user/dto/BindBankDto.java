package com.cloud.user.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 绑定银行卡信息
 *
 * @author ai-cloud
 */
@Data
@ApiModel("绑定银行卡信息")
public class BindBankDto {

    @ApiModelProperty(value = "姓名", example = "小宝贝")
    private String bankName;

    @ApiModelProperty(value = "卡号", example = "6888888888888888888")
    private String bankCard;

    @ApiModelProperty(value = "开户行名称", example = "中国银行")
    private String bankAccount;

}
