package com.peng.seckill.seckill.dao;


import com.peng.seckill.seckill.entity.Seckill;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface SeckillDao{

    int deleteByPrimaryKey(Long seckillId);

    int insert(Seckill record);

    int insertSelective(Seckill record);

    Seckill selectByPrimaryKey(Long seckillId);

    int updateByPrimaryKeySelective(Seckill record);

    int updateByPrimaryKey(Seckill record);

    List<Seckill> selectAll();
    /**
     * 减库存
     *
     * @param seckillId
     * @param killTime
     * @return 如果影响行数>1，表示更新库存的记录行数
     */
    int reduceNumbers(@Param("seckillId") long seckillId, @Param("killTime") Date killTime);

    /**
     * 模糊查询
     * @param sname
     * @return
     */
    List<Seckill> selectLikeBySname(@Param("sname") String sname);

    /**
     * 按商品分类查询
     * @param cid
     * @return
     */
    List<Seckill> selectByCategory(@Param("cid") long cid);

    /**
     * 查询最新的4个商品
     * @return
     */
    List<Seckill> selectByNewTime();
    /**
     * 查询库存最多
     * @return
     */
    List<Seckill> selectLargeNumbers();

    /**
     * 返回hashmap类型的值商品列表
     * @return
     */
    List<HashMap<String,Object>> selectAllToHashMap();
    /**
     * 模糊查询商品列表返回hashmap类型的值
     * @return
     */
    List<HashMap<String,Object>> selectSeckillListByLike(@Param("sname")String sname,
                                                         @Param("startTime")String startTime,
                                                         @Param("endTime")String endTime,
                                                         @Param("createTime")String createTime,
                                                         @Param("seckillDesc")String seckillDesc,
                                                         @Param("price")String price,
                                                         @Param("cname")String cname
                                                         );
}