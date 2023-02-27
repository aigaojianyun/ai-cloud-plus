package com.cloud.system.resource.service;

import com.cloud.system.resource.domain.AiCountry;

import java.util.List;

/**
 * 区域信息Service接口
 *
 * @author ai-cloud
 */
public interface IAiCountryService {
    /**
     * 查询区域信息
     *
     * @param id 区域信息主键
     * @return 区域信息
     */
    public AiCountry selectAiCountryById(Long id);

    /**
     * 查询区域信息列表
     *
     * @param aiCountry 区域信息
     * @return 区域信息集合
     */
    public List<AiCountry> selectAiCountryList(AiCountry aiCountry);

    /**
     * 新增区域信息
     *
     * @param aiCountry 区域信息
     * @return 结果
     */
    public int insertAiCountry(AiCountry aiCountry);

    /**
     * 修改区域信息
     *
     * @param aiCountry 区域信息
     * @return 结果
     */
    public int updateAiCountry(AiCountry aiCountry);

    /**
     * 批量删除区域信息
     *
     * @param ids 需要删除的区域信息主键集合
     * @return 结果
     */
    public int deleteAiCountryByIds(Long[] ids);

    /**
     * 删除区域信息
     *
     * @param id 区域信息主键
     * @return 结果
     */
    public int deleteAiCountryById(Long id);

    /**
     * 校验区域是否唯一
     *
     * @param aiCountry 参数信息
     * @return 结果
     */
    public boolean checkAiCountryUnique(AiCountry aiCountry);
}
