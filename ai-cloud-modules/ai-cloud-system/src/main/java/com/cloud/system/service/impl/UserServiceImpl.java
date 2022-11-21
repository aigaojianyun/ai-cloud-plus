package com.cloud.system.service.impl;

import com.cloud.system.api.domain.User;
import com.cloud.system.mapper.UserMapper;
import com.cloud.system.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户信息Service业务层处理
 *
 * @author ai-cloud
 */
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 通过用户名或手机号查询用户
     *
     * @param param 用户名或手机号
     * @return 用户对象信息
     */
    @Override
    public User selectByUserNamePhone(String param) {
        return userMapper.selectByUserNamePhone(param);
    }

    /**
     * 通过用户ID查询用户
     *
     * @param id 用户ID
     * @return 用户对象信息
     */
    @Override
    public User selectById(Long id) {
        return userMapper.selectById(id);
    }

    /**
     * 新增用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public int insertUser(User user) {
        return userMapper.insert(user);
    }

    /**
     * 更新用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public int updateById(User user) {
        return userMapper.updateById(user);
    }

    /**
     * 批量删除用户信息
     *
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    @Override
    public int deleteByIds(Long[] userIds) {
        return userMapper.deleteByIds(userIds);
    }



}
