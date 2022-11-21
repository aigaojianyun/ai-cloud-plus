package com.cloud.user.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 执行变更账户参数
 *
 * @author ai-cloud
 */
@Data
@ApiModel("执行变更账户参数")
public class ChangeAccountParam {

    @ApiModelProperty(value = "减少人id", example = "1")
    private String subUserId;

    @ApiModelProperty(value = "减少数量", example = "1")
    private BigDecimal subNum;

    @ApiModelProperty(value = "新增人ID", example = "1")
    private String addUserId;

    @ApiModelProperty(value = "新增数量", example = "1")
    private BigDecimal addNum;

    @ApiModelProperty(value = "手续费", example = "1")
    private BigDecimal charge;

    @ApiModelProperty(value = "订单号", example = "1")
    private String orderNumber;

    @ApiModelProperty(value = "变更账户类型", example = "1")
    private String accountType;

    @ApiModelProperty(value = "交易名称", example = "1")
    private String dealName;

    @ApiModelProperty(value = "交易类型", example = "1")
    private String dealType;

}
