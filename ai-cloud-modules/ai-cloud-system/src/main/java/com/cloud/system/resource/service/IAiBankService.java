package com.cloud.system.resource.service;

import com.cloud.system.resource.domain.AiBank;

import java.util.List;

/**
 * 银行信息Service接口
 *
 * @author ai-cloud
 */
public interface IAiBankService {
    /**
     * 查询银行信息
     *
     * @param id 银行信息主键
     * @return 银行信息
     */
    public AiBank selectAiBankById(Long id);

    /**
     * 查询银行信息列表
     *
     * @param aiBank 银行信息
     * @return 银行信息集合
     */
    public List<AiBank> selectAiBankList(AiBank aiBank);

    /**
     * 新增银行信息
     *
     * @param aiBank 银行信息
     * @return 结果
     */
    public int insertAiBank(AiBank aiBank);

    /**
     * 修改银行信息
     *
     * @param aiBank 银行信息
     * @return 结果
     */
    public int updateAiBank(AiBank aiBank);

    /**
     * 批量删除银行信息
     *
     * @param ids 需要删除的银行信息主键集合
     * @return 结果
     */
    public int deleteAiBankByIds(Long[] ids);

    /**
     * 删除银行信息信息
     *
     * @param id 银行信息主键
     * @return 结果
     */
    public int deleteAiBankById(Long id);

    /**
     * 校验银行名称是否唯一
     *
     * @param aiBank 参数信息
     * @return 结果
     */
    public boolean  checkAiBankUnique(AiBank aiBank);
}
