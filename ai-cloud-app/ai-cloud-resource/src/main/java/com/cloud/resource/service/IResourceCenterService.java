package com.cloud.resource.service;


import com.cloud.resource.dto.ContinentDto;
import com.cloud.resource.dto.CountryDto;

import java.util.List;

/**
 * 公共资源Service接口
 *
 * @author ai-cloud
 */
public interface IResourceCenterService {

    /**
     * 查询七大洲
     *
     * @param language 语言类型
     * @return 七大洲信息
     */
    public List<ContinentDto> selectByContinentList(String language);

    /**
     * 查询区域国家信息
     *
     * @param language 语言类型
     * @return 区域国家信息
     */
    public List<CountryDto> selectByCountryList(String language);


}
