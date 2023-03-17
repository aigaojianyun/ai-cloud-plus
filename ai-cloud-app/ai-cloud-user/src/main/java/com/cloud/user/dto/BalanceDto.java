package com.cloud.user.dto;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 钱包余额
 *
 * @author ai-cloud
 */
@Data
@ApiModel("钱包余额")
public class BalanceDto {

    @ApiModelProperty(value = "账户可用余额", example = "0.6320")
    private BigDecimal availableBalance;

    @ApiModelProperty(value = "账户冻结金额", example = "0.0012")
    private BigDecimal frozenAmount;

}
