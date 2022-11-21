package com.cloud.file.api.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 文件信息
 *
 * @author ai-cloud
 */
@Data
@ApiModel("文件信息")
public class File {
    /**
     * 文件名称
     */
    @ApiModelProperty(value = "文件名称", example = "String")
    private String name;

    /**
     * 文件地址
     */
    @ApiModelProperty(value = "文件地址", example = "String")
    private String url;

}
