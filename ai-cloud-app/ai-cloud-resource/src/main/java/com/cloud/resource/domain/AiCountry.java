package com.cloud.resource.domain;

import com.cloud.common.web.domain.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 区域信息对象 ai_country
 *
 * @author ai-cloud
 *
 */
@Data
@ApiModel("区域信息")
public class AiCountry extends BaseEntity {

    private static final long serialVersionUID=1L;

    /** id */
    private Long id;

    /** 中文名称 */
    @ApiModelProperty(value = "中文名称", example = "String")
    private String cnName;

    /** 英文名称 */
    @ApiModelProperty(value = "英文名称", example = "String")
    private String enName;

    /** icon */
    @ApiModelProperty(value = "icon", example = "String")
    private String countryIcon;

    /** 区号 */
    @ApiModelProperty(value = "区号", example = "String")
    private String areaCode;

    /** 语言 */
    @ApiModelProperty(value = "语言", example = "String")
    private String language;

    /** 当地货币缩写 */
    @ApiModelProperty(value = "当地货币缩写", example = "String")
    private String localCurrency;

    /** 排序 */
    @ApiModelProperty(value = "排序", example = "Long")
    private Long sort;

}


