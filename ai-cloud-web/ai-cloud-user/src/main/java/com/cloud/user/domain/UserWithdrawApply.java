package com.cloud.user.domain;

import com.cloud.common.web.domain.Entity;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 用户提现申请记录对象 user_withdraw_apply
 *
 * @author ai-cloud
 */
@Data
@ApiModel("用户提现申请记录")
public class UserWithdrawApply extends Entity {

    private static final long serialVersionUID = 1L;

    /**
     * 提现记录id
     */
    private Long id;

    /**
     * 用户id
     */
    @ApiModelProperty(value = "用户id", example = "String")
    private Long userId;

    /**
     * 设备唯一标示
     */
    @ApiModelProperty(value = "设备唯一标示", example = "String")
    private String uuid;

    /**
     * 提现方式；1：支付宝 2：银行卡
     */
    @ApiModelProperty(value = "提现方式；1：支付宝 2：银行卡", example = "String")
    private Integer belongBank;

    /**
     * 开户行姓名
     */
    @ApiModelProperty(value = "开户行姓名", example = "String")
    private String bankName;

    /**
     * 开户行账号
     */
    @ApiModelProperty(value = "开户行账号", example = "String")
    private String bankAccount;

    /**
     * 卡号
     */
    @ApiModelProperty(value = "卡号", example = "String")
    private String bankCard;

    /**
     * 支付宝账户
     */
    @ApiModelProperty(value = "支付宝账户", example = "String")
    private String alipayAccount;

    /**
     * 支付宝姓名
     */
    @ApiModelProperty(value = "支付宝姓名", example = "String")
    private String alipayName;

    /**
     * 提现金额
     */
    @ApiModelProperty(value = "提现金额", example = "BigDecimal")
    private BigDecimal amount;

    /**
     * 交易流水号
     */
    @ApiModelProperty(value = "交易流水号", example = "String")
    private String dealSerialNumber;

    /**
     * 商户流水号
     */
    @ApiModelProperty(value = "商户流水号", example = "String")
    private String merchantSerialNumber;

    /**
     * 提现手续费
     */
    @ApiModelProperty(value = "提现手续费", example = "String")
    private String serviceCharge;

    /**
     * 结算账金额
     */
    @ApiModelProperty(value = "结算账金额", example = "String")
    private String settlementAmount;

    /**
     * 提现状态；1：待审核 2：审核通过 3：审核拒绝
     */
    @ApiModelProperty(value = "提现状态；1：待审核 2：审核通过 3：审核拒绝", example = "Long")
    private Long status;

    /**
     * 打款状态 1：待确认 2：已打款 3：拒绝打款
     */
    @ApiModelProperty(value = "打款状态 1：待确认 2：已打款 3：拒绝打款", example = "Long")
    private Long remitStatus;

    /**
     * 申请时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "申请时间", example = "Date")
    private Date applyTime;

    /**
     * 审核通过时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "审核通过时间", example = "Date")
    private Date acceptApplyTime;

    /**
     * 审核通过扣款流水号（冗余）
     */
    @ApiModelProperty(value = "审核通过扣款流水号", example = "String")
    private String acceptApplySerialNumber;

    /**
     * 确认打款时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "确认打款时间", example = "Date")
    private Date remitTime;

    /**
     * 确认打款交易流水号(冗余)
     */
    @ApiModelProperty(value = "确认打款交易流水号(冗余)", example = "String")
    private String remitSerialNumber;

    /**
     * 外部汇款凭证号
     */
    @ApiModelProperty(value = "外部汇款凭证号", example = "String")
    private String otherNumber;

    /**
     * 审核/打款 拒绝时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "审核/打款 拒绝时间", example = "Date")
    private Date refuseApplyTime;

    /**
     * 打款拒绝退款流水号
     */
    @ApiModelProperty(value = "打款拒绝退款流水号", example = "String")
    private String refuseSerialNumber;

    /**
     * 备注
     */
    @ApiModelProperty(value = "备注", example = "String")
    private String remarks;

    /**
     * 删除：0：未删除，2：已删除
     */
    @ApiModelProperty(value = "删除：0：未删除，2：已删除", example = "Long")
    private Long deleteFlag;


}
