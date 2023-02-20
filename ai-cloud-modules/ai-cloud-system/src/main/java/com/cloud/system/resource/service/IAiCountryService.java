package com.cloud.system.resource.service;

import com.cloud.system.resource.domain.AiCountry;

import java.util.List;

/**
 * 国家信息Service接口
 *
 * @author ai-cloud
 */
public interface IAiCountryService {
    /**
     * 查询国家信息
     *
     * @param id 国家信息主键
     * @return 国家信息
     */
    public AiCountry selectAiCountryById(Long id);

    /**
     * 查询国家信息列表
     *
     * @param aiCountry 国家信息
     * @return 国家信息集合
     */
    public List<AiCountry> selectAiCountryList(AiCountry aiCountry);

    /**
     * 新增国家信息
     *
     * @param aiCountry 国家信息
     * @return 结果
     */
    public int insertAiCountry(AiCountry aiCountry);

    /**
     * 修改国家信息
     *
     * @param aiCountry 国家信息
     * @return 结果
     */
    public int updateAiCountry(AiCountry aiCountry);

    /**
     * 批量删除国家信息
     *
     * @param ids 需要删除的国家信息主键集合
     * @return 结果
     */
    public int deleteAiCountryByIds(Long[] ids);

    /**
     * 删除国家信息信息
     *
     * @param id 国家信息主键
     * @return 结果
     */
    public int deleteAiCountryById(Long id);
}
