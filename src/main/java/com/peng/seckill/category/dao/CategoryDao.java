package com.peng.seckill.category.dao;

import com.peng.seckill.category.entity.Category;

import java.util.List;

public interface CategoryDao {

    /**
     * 查找所有分类
     * @return
     */
    List<Category> findAllCategory();

    /**
     * 添加商品分类
     * @param category
     */
    int addCategory(Category category);

    /**
     * 删除一个分类
     * @param cid
     * @return
     */
    int deleteByPrimaryKey(long cid);

    /**
     * 根据cid查询分类
     * @param cid
     */
    Category selectByPrimaryKey(long cid);

    /**
     * 修改商品分类
     * @param category
     */
    int updateByPrimaryKeySelective(Category category);

}