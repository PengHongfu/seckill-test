package com.peng.seckill.seckill.service;

import com.peng.seckill.seckill.dto.Exposer;
import com.peng.seckill.seckill.dto.SeckillExecution;
import com.peng.seckill.seckill.entity.Seckill;
import com.peng.seckill.seckill.exception.RepeatKillException;
import com.peng.seckill.seckill.exception.SeckillCloseException;
import com.peng.seckill.seckill.exception.SeckillException;

import java.util.HashMap;
import java.util.List;

/**
 * Created by Peng
 * Time: 2017/4/20 10:36
 */
public interface SeckillService {
    /**
     * 保存seckill
     * @param record
     * @return
     */
    int insertSelective(Seckill record);
    /**
     * 查询全部秒杀商品
     *
     * @return
     */
    List<Seckill> selectAll();

    /**
     * 根据主键查询
     *
     * @param seckillId
     * @return
     */
    Seckill selectByPrimaryKey(Long seckillId);

    /**
     * 在秒杀开启时输出秒杀接口的地址，
     * 否则输出系统时间和秒杀时间
     *
     * @param seckillId
     */
    Exposer exportSeckillUrl(long seckillId);

    /**
     * 执行秒杀操作，有可能失败，有可能成功，所以要抛出我们允许的异常
     *
     * @param seckillId
     * @param uid
     * @param md5
     * @return
     */
    SeckillExecution executeSeckill(long seckillId, String uid, String md5)
            throws SeckillException, RepeatKillException, SeckillCloseException;
    /**
     * 执行秒杀操作 by 存储过程
     * @param seckillId
     * @param uid
     * @param md5
     * @return
     */
    SeckillExecution executeSeckillProcedure(long seckillId, String uid, String md5);
    /**
     * 模糊查询
     *
     * @param sname
     * @return
     */
    List<Seckill> selectLikeBySname(String sname);

    /**
     * 按商品分类查询
     *
     * @param cid
     * @return
     */
    List<Seckill> selectByCategory(long cid);

    /**
     * 查询最新的4个商品
     *
     * @return
     */
    List<Seckill> selectByNewTime();

    /**
     * 查询库存最多
     *
     * @return
     */
    List<Seckill> selectLargeNumbers();

    /**
     * 返回hashmap类型的值
     *
     * @return
     */
    List<HashMap<String, Object>> selectAllToHashMap();

    /**
     * 模糊查询商品列表返回hashmap类型的值
     *
     * @return
     */
    List<HashMap<String, Object>> selectSeckillListByLike(String sname,
                                                          String startTime,
                                                          String endTime,
                                                          String createTime,
                                                          String seckillDesc,
                                                          String price,
                                                          String cname
    );

    /**
     *删除id
     * @param seckillid
     * @return
     */
    int deleteByPrimaryKey (long seckillid);
}
