package com.cloud.resource.controller;


import com.cloud.common.constant.LangConstants;
import com.cloud.common.domain.R;
import com.cloud.resource.dto.ContinentDto;
import com.cloud.resource.dto.CountryDto;
import com.cloud.resource.service.IResourceCenterService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 公共资源
 *
 * @author ai-cloud
 */
@Api(tags = "公共资源")
@RestController
@RequestMapping("center")
public class ResourceCenterApi {

    @Autowired
    private IResourceCenterService resourceCenterService;

    /**
     * 查询七大洲
     *
     * @param language 语言类型
     * @return 七大洲信息
     */
    @PostMapping("/continent")
    @ApiOperation(value = "查询七大洲", notes = "查询七大洲")
    public R<List<ContinentDto>> selectByContinentList(@RequestHeader(value = LangConstants.LANGUAGE, required = true)
                                                       @ApiParam(value = "语言类型", example = "zh-CN") String language) {
        return R.ok(resourceCenterService.selectByContinentList(language));
    }

    /**
     * 查询区域国家信息
     *
     * @param language 语言类型
     * @return 区域国家信息
     */
    @PostMapping("/country")
    @ApiOperation(value = "查询区域国家", notes = "查询区域国家")
    public R<List<CountryDto>> selectByCountryList(@RequestHeader(value = LangConstants.LANGUAGE, required = true)
                                                   @ApiParam(value = "语言类型", example = "zh-CN") String language) {
        return R.ok(resourceCenterService.selectByCountryList(language));
    }


}
