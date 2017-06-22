package com.peng.seckill.user.service.impl;

import com.peng.seckill.user.dao.UserDao;
import com.peng.seckill.user.entity.User;
import com.peng.seckill.user.exception.UserException;
import com.peng.seckill.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

/**
 * Created by Peng
 * Time: 2017/4/17 16:53
 * User业务层
 */
@Transactional
@Service("userService")
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    @Override
    public User selectByPrimaryKey(String uid) {
        return userDao.selectByPrimaryKey(uid);
    }

    @Override
    public int insertSelective(User user) throws UserException {
        //补全Uid
        user.setUid(UUID.randomUUID().toString().replace("-", "").toUpperCase());
        try{
            return userDao.insertSelective(user);
        } catch(RuntimeException e){
            throw new UserException("注册出错了！"+e.getMessage());
        }

    }

    @Override
    public List<User> selectAll() {
        return userDao.selectAll();
    }

    @Override
    public User selectByNameAndPass(User user) {
        return userDao.selectByNameAndPass(user);
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {
        return userDao.updateByPrimaryKeySelective(record);
    }
}
