package com.cloud.system.resource.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cloud.system.coin.domain.Coin;
import com.cloud.system.resource.domain.AiBank;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 银行信息Mapper接口
 *
 * @author ai-cloud
 */
@Mapper
public interface AiBankMapper extends BaseMapper<AiBank> {
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
     * 校验银行名称
     *
     * @param bankName 银行名称
     * @return 结果
     */
    public AiBank checkBankNameUnique(String bankName);

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
     * 删除银行信息
     *
     * @param id 银行信息主键
     * @return 结果
     */
    public int deleteAiBankById(Long id);

    /**
     * 批量删除银行信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAiBankByIds(Long[] ids);
}
