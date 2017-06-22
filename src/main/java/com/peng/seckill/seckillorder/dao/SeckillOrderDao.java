package com.peng.seckill.seckillorder.dao;

import com.peng.seckill.seckillorder.entity.SeckillOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Peng
 * Time: 2017/4/22 21:40
 */
public interface SeckillOrderDao {


    List<SeckillOrder> findByUserId(String uid);

    /**
     * 通过userID和商品ID查询重复秒杀
     *
     * @param uid
     * @param seckillId
     * @return
     */
    SeckillOrder findByUserIdAndSeckillId(@Param("uid") String uid, @Param("seckill_id") Long seckillId);

    /**
     * 添加秒杀商品订单
     *
     * @param orderid
     * @param seckillid
     * @param userid
     * @return
     */
    int insert(@Param("orderid") String orderid, @Param("seckillid") Long seckillid, @Param("userid") String userid);

    /**
     * 通过订单号和状态码，修改状态码(可以通用的方法 删除订单，修改订单等)
     *
     * @param orderId
     * @param state
     * @return
     */
    int updateStateByorderId(@Param("orderId") String orderId, @Param("state") int state);

    /**
     * 通过订单号查询订单信息
     *
     * @param orderId
     * @return
     */
    SeckillOrder findBySeckillOrderId(String orderId);

    /**
     * 管理员查询所有订单
     *
     * @return
     */
    List<SeckillOrder> findAllOrderByAdmin();

    /**
     * 模糊查询订单
     *
     *
     * @return
     */
    List<SeckillOrder> orderFindByLike(@Param("orderId") String orderId,
                                       @Param("sname") String sname,
                                       @Param("loginname") String loginname,
                                       @Param("createTime") String createTime);
}
