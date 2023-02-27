package com.cloud.system.resource.service.impl;

import com.cloud.common.constant.UserConstants;
import com.cloud.common.utils.DateUtils;
import com.cloud.common.utils.StringUtils;
import com.cloud.system.resource.domain.AiCountry;
import com.cloud.system.resource.mapper.AiCountryMapper;
import com.cloud.system.resource.service.IAiCountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 区域信息Service业务层处理
 *
 * @author ai-cloud
 */
@Service
public class AiCountryServiceImpl implements IAiCountryService {
    @Autowired
    private AiCountryMapper aiCountryMapper;

    /**
     * 查询区域信息
     *
     * @param id 区域信息主键
     * @return 区域信息
     */
    @Override
    public AiCountry selectAiCountryById(Long id) {
        return aiCountryMapper.selectAiCountryById(id);
    }

    /**
     * 查询区域信息列表
     *
     * @param aiCountry 区域信息
     * @return 区域信息
     */
    @Override
    public List<AiCountry> selectAiCountryList(AiCountry aiCountry) {
        return aiCountryMapper.selectAiCountryList(aiCountry);
    }

    /**
     * 新增区域信息
     *
     * @param aiCountry 区域信息
     * @return 结果
     */
    @Override
    public int insertAiCountry(AiCountry aiCountry) {
        aiCountry.setCreateTime(DateUtils.getNowDate());
        return aiCountryMapper.insertAiCountry(aiCountry);
    }

    /**
     * 修改区域信息
     *
     * @param aiCountry 区域信息
     * @return 结果
     */
    @Override
    public int updateAiCountry(AiCountry aiCountry) {
        aiCountry.setUpdateTime(DateUtils.getNowDate());
        return aiCountryMapper.updateAiCountry(aiCountry);
    }

    /**
     * 批量删除区域信息
     *
     * @param ids 需要删除的区域信息主键
     * @return 结果
     */
    @Override
    public int deleteAiCountryByIds(Long[] ids) {
        return aiCountryMapper.deleteAiCountryByIds(ids);
    }

    /**
     * 删除区域信息
     *
     * @param id 区域信息主键
     * @return 结果
     */
    @Override
    public int deleteAiCountryById(Long id) {
        return aiCountryMapper.deleteAiCountryById(id);
    }

    /**
     * 校验区域是否唯一
     *
     * @param aiCountry 参数信息
     * @return 结果
     */
    @Override
    public boolean checkAiCountryUnique(AiCountry aiCountry) {
        Long countryId = StringUtils.isNull(aiCountry.getId()) ? -1L : aiCountry.getId();
        AiCountry info = aiCountryMapper.checkcnNameUnique(aiCountry.getCnName());
        if (StringUtils.isNotNull(info) && info.getId().longValue() != countryId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }
}
