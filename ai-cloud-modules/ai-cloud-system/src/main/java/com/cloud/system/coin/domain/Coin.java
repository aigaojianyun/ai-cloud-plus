package com.cloud.system.coin.domain;

import java.math.BigDecimal;

import com.cloud.common.web.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 货币对象 coin
 *
 * @author ai-cloud
 *
 */
@Data
@ApiModel("货币")
public class Coin extends BaseEntity {

private static final long serialVersionUID=1L;

    /** id */
    private Long id;

    /** 货币名称 */
    @ApiModelProperty(value = "货币名称", example = "String")
    private String name;

    /** 中文名称 */
    @ApiModelProperty(value = "中文名称", example = "String")
    private String cnName;

    /** 英文简称 */
    @ApiModelProperty(value = "英文简称", example = "String")
    private String enName;

    /** logo图url */
    @ApiModelProperty(value = "logo图url", example = "String")
    private String iconUrl;

    /** 币种资料链接 */
    @ApiModelProperty(value = "币种资料链接", example = "String")
    private String infolink;

    /** 币种简介 */
    @ApiModelProperty(value = "币种简介", example = "String")
    private String information;

    /** 最小提币手续费 */
    @ApiModelProperty(value = "最小提币手续费", example = "Double")
    private Double minTxFee;

    /** 最小提币数量 */
    @ApiModelProperty(value = "最小提币数量", example = "BigDecimal")
    private BigDecimal minWithdrawAmount;

    /** 最大提币手续费 */
    @ApiModelProperty(value = "最大提币手续费", example = "Double")
    private Double maxTxFee;

    /** 最大提币数量 */
    @ApiModelProperty(value = "最大提币数量", example = "BigDecimal")
    private BigDecimal maxWithdrawAmount;

    /** 对人民币汇率 */
    @ApiModelProperty(value = "对人民币汇率", example = "Double")
    private Double cnyRate;

    /** 对美元汇率 */
    @ApiModelProperty(value = "对美元汇率", example = "Double")
    private Double usdRate;

    /** 是否能提币 0:是 1:否 */
    @ApiModelProperty(value = "是否能提币 0:是 1:否", example = "Integer")
    private Integer canWithdraw;

    /** 是否能充币 0:是 1:否 */
    @ApiModelProperty(value = "是否能充币 0:是 1:否", example = "Integer")
    private Integer canRecharge;

    /** 是否能转账 0:是 1:否 */
    @ApiModelProperty(value = "是否能转账 0:是 1:否", example = "Integer")
    private Integer canTransfer;

    /** 是否能自动提币 0:是 1:否 */
    @ApiModelProperty(value = "是否能自动提币 0:是 1:否", example = "Integer")
    private Integer canAutoWithdraw;

    /** 充币阈值 */
    @ApiModelProperty(value = "充币阈值", example = "BigDecimal")
    private BigDecimal rechargeAmount;

    /** 提现阈值 */
    @ApiModelProperty(value = "提现阈值", example = "BigDecimal")
    private BigDecimal withdrawThreshold;

    /** 转账时付给矿工的手续费 */
    @ApiModelProperty(value = "转账时付给矿工的手续费", example = "BigDecimal")
    private BigDecimal minerFee;

    /** 账户类型 0:默认 1:EOS类型 */
    @ApiModelProperty(value = "账户类型 0:默认 1:EOS类型", example = "Long")
    private Long accountType;

    /** 充值地址（仅账户类型为EOS类型有效） */
    @ApiModelProperty(value = "充值地址", example = "String")
    private String depositAddress;

    /** 排序 */
    @ApiModelProperty(value = "排序", example = "Long")
    private Long sort;

    /** 状态：0启用，2停用 */
    @ApiModelProperty(value = "状态：0启用，2停用", example = "Long")
    private Long statusFlag;

    /** 删除：0未删除，2已删除 */
    @ApiModelProperty(value = "删除：0未删除，2已删除", example = "Long")
    private Long deleteFlag;

}


