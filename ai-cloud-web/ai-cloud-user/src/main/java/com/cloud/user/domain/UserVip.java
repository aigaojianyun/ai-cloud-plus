package com.cloud.user.domain;

import com.cloud.common.web.domain.Entity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 会员对象 user_vip
 *
 * @author ai-cloud
 */
@Data
@ApiModel("会员")
public class UserVip extends Entity {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    private String id;

    /**
     * 会员名称
     */
    @ApiModelProperty(value = "会员名称", example = "String")
    private String name;

    /**
     * 会员介绍
     */
    @ApiModelProperty(value = "会员介绍", example = "String")
    private String introduce;

    /**
     * 会员封面图
     */
    @ApiModelProperty(value = "会员封面图", example = "String")
    private String coverImg;

    /**
     * 会员图标
     */
    @ApiModelProperty(value = "会员图标", example = "String")
    private String icon;

    /**
     * 会员月费价格
     */
    @ApiModelProperty(value = "会员月费价格", example = "BigDecimal")
    private BigDecimal monthPrice;

    /**
     * 会员年费价格
     */
    @ApiModelProperty(value = "会员年费价格", example = "BigDecimal")
    private BigDecimal yearPrice;

    /**
     * 权重值
     */
    @ApiModelProperty(value = "权重值", example = "Long")
    private Long weight;

    /**
     * 状态：1：启用，0：停用
     */
    @ApiModelProperty(value = "状态：1：启用，0：停用", example = "Long")
    private Long statusFlag;

    /**
     * 1:删除，0：未删除
     */
    @ApiModelProperty(value = "1:删除，0：未删除", example = "Long")
    private Long deleteFlag;

}


