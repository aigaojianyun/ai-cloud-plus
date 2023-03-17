package com.cloud.user.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cloud.user.api.domain.UserAuth;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户第三方授权Mapper接口
 *
 * @author ai-cloud
 */
@Mapper
public interface UserAuthMapper extends BaseMapper<UserAuth> {

}
