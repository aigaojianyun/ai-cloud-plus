package com.cloud.resource.domain;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 七大洲信息对象 ai_continent
 *
 * @author ai-cloud
 *
 */
@Data
public class AiContinent {

    /** id */
    private Long id;

    /** 中文名 */
    @ApiModelProperty(value = "中文名", example = "String")
    private String cnName;

    /** 英文名 */
    @ApiModelProperty(value = "英文名", example = "String")
    private String enName;

}
