package com.cloud.user.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 钱包账单信息
 *
 * @author ai-cloud
 */
@Data
@ApiModel("账单信息")
public class BillDto {

    @ApiModelProperty(value = "账单id", example = "1585887557841014786")
    private String detailId;

    @ApiModelProperty(value = "头像", example = "https://aicloud.png")
    private String img;

    @ApiModelProperty(value = "金额", example = "1000")
    private BigDecimal amount;

    @ApiModelProperty(value = "交易类型；1：收入 2：支出", example = "1")
    private String type;

    @ApiModelProperty(value = "交易类型；1：充值 2：提现 3：消费 4：转账 5：红包 6： 退款 7：其他", example = "1")
    private String dealType;

    @ApiModelProperty(value = "交易名称", example = "余额提现")
    private String dealName;

    @ApiModelProperty(value = "交易时间", example = "2020-01-01")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

}
