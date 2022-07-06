package com.cloud.user.param;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * 钱包变更参数
 *
 * @author ai-cloud
 */
@Data
@Getter
@Setter
@ApiModel("钱包变更参数")
public class ChangeWalletParam {

    @ApiModelProperty(value = "减少人id", example = "1")
    private String subUserId;

    @ApiModelProperty(value = "减少数量", example = "1")
    private BigDecimal subNum;

    @ApiModelProperty(value = "新增人ID", example = "1")
    private String addUserId;

    @ApiModelProperty(value = "新增数量", example = "1")
    private BigDecimal addNum;

    @ApiModelProperty(value = "手续费", example = "1")
    private String charge;

}

