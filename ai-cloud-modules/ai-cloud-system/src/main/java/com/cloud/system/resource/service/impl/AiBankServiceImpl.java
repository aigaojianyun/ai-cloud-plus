package com.cloud.system.resource.service.impl;

import com.cloud.common.constant.UserConstants;
import com.cloud.common.utils.DateUtils;
import com.cloud.common.utils.StringUtils;
import com.cloud.system.resource.domain.AiBank;
import com.cloud.system.resource.mapper.AiBankMapper;
import com.cloud.system.resource.service.IAiBankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 银行信息Service业务层处理
 *
 * @author ai-cloud
 */
@Service
public class AiBankServiceImpl implements IAiBankService {
    @Autowired
    private AiBankMapper aiBankMapper;

    /**
     * 查询银行信息
     *
     * @param id 银行信息主键
     * @return 银行信息
     */
    @Override
    public AiBank selectAiBankById(Long id) {
        return aiBankMapper.selectAiBankById(id);
    }

    /**
     * 查询银行信息列表
     *
     * @param aiBank 银行信息
     * @return 银行信息
     */
    @Override
    public List<AiBank> selectAiBankList(AiBank aiBank) {
        return aiBankMapper.selectAiBankList(aiBank);
    }

    /**
     * 新增银行信息
     *
     * @param aiBank 银行信息
     * @return 结果
     */
    @Override
    public int insertAiBank(AiBank aiBank) {
        aiBank.setCreateTime(DateUtils.getNowDate());
        return aiBankMapper.insertAiBank(aiBank);
    }

    /**
     * 修改银行信息
     *
     * @param aiBank 银行信息
     * @return 结果
     */
    @Override
    public int updateAiBank(AiBank aiBank) {
        aiBank.setUpdateTime(DateUtils.getNowDate());
        return aiBankMapper.updateAiBank(aiBank);
    }

    /**
     * 批量删除银行信息
     *
     * @param ids 需要删除的银行信息主键
     * @return 结果
     */
    @Override
    public int deleteAiBankByIds(Long[] ids) {
        return aiBankMapper.deleteAiBankByIds(ids);
    }

    /**
     * 删除银行信息信息
     *
     * @param id 银行信息主键
     * @return 结果
     */
    @Override
    public int deleteAiBankById(Long id) {
        return aiBankMapper.deleteAiBankById(id);
    }


    /**
     * 校验银行名称是否唯一
     *
     * @param aiBank 参数信息
     * @return 结果
     */
    @Override
    public boolean checkAiBankUnique(AiBank aiBank) {
        Long bankId = StringUtils.isNull(aiBank.getId()) ? -1L : aiBank.getId();
        AiBank info = aiBankMapper.checkBankNameUnique(aiBank.getBankName());
        if (StringUtils.isNotNull(info) && info.getId().longValue() != bankId.longValue()) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }
}
