package com.cloud.resource.dto;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 区域国家信息
 *
 * @author ai-cloud
 */
@Data
@ApiModel("区域国家")
public class CountryDto {

    @ApiModelProperty(value = "id", example = "1")
    private Long id;

    @ApiModelProperty(value = "名称", example = "中国大陆")
    private String countryName;

    @ApiModelProperty(value = "国徽icon", example = "https://country/China.png")
    private String countryIcon;

    @ApiModelProperty(value = "区号", example = "+86")
    private String areaCode;

    @ApiModelProperty(value = "语言", example = "zh-CN")
    private String language;

    @ApiModelProperty(value = "当地货币缩写", example = "CNY")
    private String localCurrency;

}
