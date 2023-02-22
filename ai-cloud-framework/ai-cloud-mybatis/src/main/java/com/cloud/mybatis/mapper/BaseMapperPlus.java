package com.cloud.mybatis.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * 自定义 Mapper 接口, 实现 自定义扩展
 *
 * @param <M> mapper 泛型
 * @param <T> table 泛型
 * @param <V> vo 泛型
 * @author ai-cloud
 */
public interface BaseMapperPlus <M, T, V> extends BaseMapper<T> {


}
