package com.cloud.system.resource.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cloud.system.coin.domain.Coin;
import com.cloud.system.resource.domain.AiCountry;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 区域信息Mapper接口
 *
 * @author ai-cloud
 */
@Mapper
public interface AiCountryMapper extends BaseMapper<AiCountry> {
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
     * 校验区域名称
     *
     * @param cnName 区域名称
     * @return 结果
     */
    public AiCountry checkcnNameUnique(String cnName);

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
     * 删除区域信息
     *
     * @param id 区域信息主键
     * @return 结果
     */
    public int deleteAiCountryById(Long id);

    /**
     * 批量删除区域信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAiCountryByIds(Long[] ids);
}
