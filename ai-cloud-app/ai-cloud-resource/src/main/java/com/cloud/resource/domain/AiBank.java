package com.cloud.resource.domain;

import com.cloud.common.web.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 银行信息对象 ai_bank
 *
 * @author ai-cloud
 *
 */
@Data
@ApiModel("银行信息")
public class AiBank extends BaseEntity {

    private static final long serialVersionUID=1L;

    /** id */
    private Long id;

    /** 银行名称 */
    @ApiModelProperty(value = "银行名称", example = "String")
    private String bankName;

    /** icon */
    @ApiModelProperty(value = "icon", example = "String")
    private String bankIcon;

    /** 排序 */
    @ApiModelProperty(value = "排序", example = "Long")
    private Long sort;

}


