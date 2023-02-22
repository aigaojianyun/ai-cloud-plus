package com.cloud.system.resource.mapper;

import com.cloud.system.resource.domain.AiCountry;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 国家信息Mapper接口
 *
 * @author ai-cloud
 */
@Mapper
public interface AiCountryMapper {
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
     * 删除国家信息
     *
     * @param id 国家信息主键
     * @return 结果
     */
    public int deleteAiCountryById(Long id);

    /**
     * 批量删除国家信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAiCountryByIds(Long[] ids);
}
