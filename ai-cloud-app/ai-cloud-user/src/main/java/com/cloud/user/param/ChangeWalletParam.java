package com.cloud.user.param;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 钱包变更参数
 *
 * @author ai-cloud
 */
@Data
@ApiModel("钱包变更参数")
public class ChangeWalletParam {

    @ApiModelProperty(value = "减少人id", example = "1572507674044665856")
    private String subUserId;

    @ApiModelProperty(value = "减少数量", example = "100")
    private BigDecimal subNum;

    @ApiModelProperty(value = "新增人ID", example = "1572146235270369280")
    private String addUserId;

    @ApiModelProperty(value = "新增数量", example = "100")
    private BigDecimal addNum;

    @ApiModelProperty(value = "手续费", example = "50")
    private String charge;

}

