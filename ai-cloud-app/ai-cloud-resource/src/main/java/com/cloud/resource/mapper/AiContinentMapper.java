package com.cloud.resource.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cloud.resource.domain.AiContinent;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 区域七大洲信息Mapper接口
 *
 * @author ai-cloud
 */
@Mapper
public interface AiContinentMapper extends BaseMapper<AiContinent> {


    /**
     * 查询七大洲
     *
     * @param
     * @return 七大洲信息
     */
    public List<AiContinent> selectByContinentList();


}
