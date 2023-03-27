package com.cloud.resource.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 七大洲
 *
 * @author ai-cloud
 */
@Data
@ApiModel("七大洲")
public class ContinentDto {

    @ApiModelProperty(value = "id", example = "1")
    private Long id;

    @ApiModelProperty(value = "七大洲名称", example = "亚洲")
    private String continentName;

}
