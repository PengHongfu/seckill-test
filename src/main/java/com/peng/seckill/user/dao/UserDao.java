package com.peng.seckill.user.dao;

/**
 * Dao层用户数据库交互层
 */

import com.peng.seckill.user.entity.User;

import java.util.List;

public interface UserDao {
    int deleteByPrimaryKey(String uid);

    int insertSelective(User record);

    User selectByPrimaryKey(String uid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<User> selectAll();

    User selectByNameAndPass(User user);
}