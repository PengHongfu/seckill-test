package com.peng.seckill.seckillorder.entity;

import com.peng.seckill.seckill.entity.Seckill;
import com.peng.seckill.user.entity.User;

import java.util.Date;

/**
 * Created by Peng
 * Time: 2017/4/22 20:46
 */
public class SeckillOrder {

    private String orderId;//订单主键
    //一对多
    private Seckill seckillId;//秒杀商品id
    private Date createTime;//创建时间，自动创建
    //多对一
    private User userId;//用户id
    private Integer state;//状态码

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Seckill getSeckillId() {
        return seckillId;
    }

    public void setSeckillId(Seckill seckillId) {
        this.seckillId = seckillId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "SeckillOrder{" +
                "orderId='" + orderId + '\'' +
                ", seckillId=" + seckillId +
                ", createTime=" + createTime +
                ", userId=" + userId +
                ", state=" + state +
                '}';
    }
}
