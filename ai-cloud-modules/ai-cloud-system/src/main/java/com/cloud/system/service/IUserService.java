package com.cloud.system.service;


import com.cloud.system.api.domain.User;
import org.apache.ibatis.annotations.Param;

/**
 * 用户信息Service接口
 *
 * @author ai-cloud
 */
public interface IUserService {

    /**
     * 通过用户名或手机号查询用户
     *
     * @param param 用户名或手机号
     * @return 用户对象信息
     */
    public User selectByUserNamePhone(@Param("param") String param);

    /**
     * 通过用户ID查询用户
     *
     * @param id 用户ID
     * @return 用户对象信息
     */
    public User selectById(Long id);

    /**
     * 新增用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    public int insertUser(User user);

    /**
     * 更新用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    public int updateById(User user);

    /**
     * 批量删除用户信息
     *
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    public int deleteByIds(Long[] userIds);


}
