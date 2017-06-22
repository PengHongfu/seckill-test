package com.peng.seckill.category.service.impl;

import com.peng.seckill.category.dao.CategoryDao;
import com.peng.seckill.category.entity.Category;
import com.peng.seckill.category.service.CategorySevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Peng
 * Time: 2017/4/28 20:09
 */

@Service("categoryService")
public class CategoryServiceImpl implements CategorySevice {
    @Autowired
    private CategoryDao categoryDao;

    @Override
    public List<Category> findAllCategory() {
        return categoryDao.findAllCategory();
    }

    @Transactional
    @Override
    public int addCategory(Category category) {
        return categoryDao.addCategory(category);
    }

    @Override
    public int deleteByPrimaryKey(long cid) throws RuntimeException {
        return categoryDao.deleteByPrimaryKey(cid);
    }

    @Override
    public Category selectByPrimaryKey(long cid) {
        return categoryDao.selectByPrimaryKey(cid);
    }

    @Override
    public int updateByPrimaryKeySelective(Category category) {
        return categoryDao.updateByPrimaryKeySelective(category);
    }
}
