package com.cloud.system.resource.service.impl;

import com.cloud.common.utils.DateUtils;
import com.cloud.system.resource.domain.AiCountry;
import com.cloud.system.resource.mapper.AiCountryMapper;
import com.cloud.system.resource.service.IAiCountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 国家信息Service业务层处理
 *
 * @author ai-cloud
 */
@Service
public class AiCountryServiceImpl implements IAiCountryService {
    @Autowired
    private AiCountryMapper aiCountryMapper;

    /**
     * 查询国家信息
     *
     * @param id 国家信息主键
     * @return 国家信息
     */
    @Override
    public AiCountry selectAiCountryById(Long id) {
        return aiCountryMapper.selectAiCountryById(id);
    }

    /**
     * 查询国家信息列表
     *
     * @param aiCountry 国家信息
     * @return 国家信息
     */
    @Override
    public List<AiCountry> selectAiCountryList(AiCountry aiCountry) {
        return aiCountryMapper.selectAiCountryList(aiCountry);
    }

    /**
     * 新增国家信息
     *
     * @param aiCountry 国家信息
     * @return 结果
     */
    @Override
    public int insertAiCountry(AiCountry aiCountry) {
                aiCountry.setCreateTime(DateUtils.getNowDate());
            return aiCountryMapper.insertAiCountry(aiCountry);
    }

    /**
     * 修改国家信息
     *
     * @param aiCountry 国家信息
     * @return 结果
     */
    @Override
    public int updateAiCountry(AiCountry aiCountry) {
                aiCountry.setUpdateTime(DateUtils.getNowDate());
        return aiCountryMapper.updateAiCountry(aiCountry);
    }

    /**
     * 批量删除国家信息
     *
     * @param ids 需要删除的国家信息主键
     * @return 结果
     */
    @Override
    public int deleteAiCountryByIds(Long[] ids) {
        return aiCountryMapper.deleteAiCountryByIds(ids);
    }

    /**
     * 删除国家信息信息
     *
     * @param id 国家信息主键
     * @return 结果
     */
    @Override
    public int deleteAiCountryById(Long id) {
        return aiCountryMapper.deleteAiCountryById(id);
    }
}
