package com.cloud.resource.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cloud.resource.domain.AiCountry;
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
     * 查询区域国家信息
     *
     * @param
     * @return 区域国家信息
     */
    public List<AiCountry> selectByCountryList();


}
