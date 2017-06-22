package com.peng.seckill.seckillorder.service.impl;

import com.peng.seckill.seckillorder.dao.SeckillOrderDao;
import com.peng.seckill.seckillorder.entity.SeckillOrder;
import com.peng.seckill.seckillorder.service.SeckillOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 订单页Controller
 * Created by Peng
 * Time: 2017/4/22 21:40
 */
@Transactional
@Service("seckillOrderService")
public class SeckillOrderServiceImpl implements SeckillOrderService{
    @Autowired
    private SeckillOrderDao seckillOrderDao;
    /**
     * 根据用户id查询秒杀订单号
     * @param uid
     * @return
     */
    @Override
    public List<SeckillOrder> findByUserId(String uid) {

        return seckillOrderDao.findByUserId(uid);
    }
    /**
     * 用于查询是否重复秒杀
     * @param uid
     * @param seckillId
     * @return
     */
    @Override
    public SeckillOrder findByUserIdAndSeckillId(String uid, Long seckillId) {
        return seckillOrderDao.findByUserIdAndSeckillId(uid,seckillId);
    }
    /**
     * 添加秒杀成功记录
     * @param orderid
     * @param seckillid
     * @param userid
     * @return
     */
    @Override
    public int insert(String orderid, Long seckillid, String userid) {
        return seckillOrderDao.insert(orderid,seckillid,userid);
    }
    /**
     * 通过订单号和状态码，修改状态码(可以通用的方法 删除订单，修改订单等)
     * @param orderId
     * @param state
     * @return
     */
    @Override
    public int updateStateByorderId(String orderId, int state) {
        return seckillOrderDao.updateStateByorderId(orderId,state);
    }
    /**
     * 通过订单号查询订单信息
     * @param orderId
     * @return
     */
    @Override
    public SeckillOrder findBySeckillOrderId(String orderId) {
        return seckillOrderDao.findBySeckillOrderId(orderId);
    }
    /**
     * 管理员查询所有订单
     * @return
     */
    @Override
    public List<SeckillOrder> findAllOrderByAdmin() {
        return seckillOrderDao.findAllOrderByAdmin();
    }


    /**
     * 模糊查询订单
     *
     * @return
     */
    @Override
    public List<SeckillOrder> orderFindByLike(String orderId, String sname, String loginname, String createTime) {
        return seckillOrderDao.orderFindByLike(orderId,sname,loginname,createTime);
    }


}
