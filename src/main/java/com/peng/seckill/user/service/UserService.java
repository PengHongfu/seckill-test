package com.peng.seckill.user.service;

import com.peng.seckill.user.entity.User;

import java.util.List;

/**
 * Created by Peng
 * Time: 2017/4/17 16:51
 */

public interface UserService {
     User selectByPrimaryKey(String uid);

     int insertSelective(User user) throws RuntimeException;

     List<User> selectAll();

     User selectByNameAndPass(User user);

     int updateByPrimaryKeySelective(User record);

}
