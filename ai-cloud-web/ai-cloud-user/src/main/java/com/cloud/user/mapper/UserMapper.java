package com.cloud.user.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cloud.user.api.domain.User;
import com.cloud.user.dto.UserInfoDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 用户信息Mapper接口
 *
 * @author ai-cloud
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    /**
     * 校验用户名称是否唯一
     *
     * @param userName 用户名称
     * @return 结果
     */
    public User checkUserNameUnique(@Param("userName") String userName);

    /**
     * 校验手机号码是否唯一
     *
     * @param phone 手机号码
     * @return 结果
     */
    public User checkPhoneUnique(@Param("phone") String phone);

    /**
     * 通过用户名或手机号查询用户
     *
     * @param param 用户名手机号或openId
     * @return 用户对象信息
     */
    public User selectByUserNamePhoneOpenId(@Param("param") String param);

    /**
     * 通过openId查询用户
     *
     * @param openId openId
     * @return 用户对象信息
     */
    public User selectByOpenId(@Param("openId") String openId);

    /**
     * 查询用户信息
     *
     * @param userId 用户id
     * @return 用户对象信息
     */
    public UserInfoDto selectByUserInfo(@Param("userId") Long userId);

    /**
     * 设置签名
     *
     * @param userId
     * @param sign
     */
    public void updateSign(@Param("userId") Long userId, @Param("sign") String sign);


}
