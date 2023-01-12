package com.cloud.user.service;


import com.cloud.user.api.domain.User;
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
     * @param param 用户名手机号或openId
     * @return 用户对象信息
     */
    public User selectByUserNamePhoneOpenId(@Param("param") String param);

    /**
     * 校验用户名称是否唯一
     *
     * @param username 用户名称
     * @return 结果
     */
    public String checkUserNameUnique(String username);

    /**
     * 校验手机号码是否唯一
     *
     * @param user 用户信息
     * @return 结果
     */
    public String checkPhoneUnique(User user);

    /**
     * 注册用户信息：新用户创建账号和账户
     *
     * @param user 用户信息
     * @return 结果
     */
    public boolean registerUser(User user);

    /**
     * 更新用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    public int updateUser(User user);

}
