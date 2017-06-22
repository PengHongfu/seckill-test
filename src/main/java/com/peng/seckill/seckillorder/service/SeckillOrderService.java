package com.peng.seckill.seckillorder.service;

import com.peng.seckill.seckillorder.entity.SeckillOrder;

import java.util.List;

/**
 * Created by Peng
 * Time: 2017/4/22 21:40
 */
public interface SeckillOrderService {

    /**
     * 根据用户id查询秒杀订单号
     * @param uid
     * @return
     */
    List<SeckillOrder> findByUserId(String uid);

    /**
     * 用于查询是否重复秒杀
     * @param uid
     * @param seckillId
     * @return
     */
    SeckillOrder findByUserIdAndSeckillId(String uid,Long seckillId);

    /**
     * 添加秒杀成功记录
     * @param orderid
     * @param seckillid
     * @param userid
     * @return
     */
    int insert( String orderid,Long seckillid,String userid);
    /**
     * 通过订单号和状态码，修改状态码(可以通用的方法 删除订单，修改订单等)
     * @param orderId
     * @param state
     * @return
     */
    int updateStateByorderId(String orderId, int state);
    /**
     * 通过订单号查询订单信息
     * @param orderId
     * @return
     */
    SeckillOrder findBySeckillOrderId(String orderId);
    /**
     * 管理员查询所有订单
     * @return
     */
    List<SeckillOrder> findAllOrderByAdmin();

    /**
     * 模糊查询订单
     *
     * @return
     */
    List<SeckillOrder> orderFindByLike( String orderId,
                                       String sname,
                                      String loginname,
                                      String createTime);
}
