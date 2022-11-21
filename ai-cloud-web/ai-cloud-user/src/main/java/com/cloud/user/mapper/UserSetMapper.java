package com.cloud.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cloud.user.domain.UserSet;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 用户设置Mapper接口
 *
 * @author ai-cloud
 */
@Mapper
public interface UserSetMapper extends BaseMapper<UserSet> {

    /**
     * 查询用户设置
     *
     * @param userId
     * @return
     */
    UserSet selectByUserId(@Param("userId") Long userId);


}
