package com.peng.seckill.seckill.dto;

import com.peng.seckill.seckill.enums.SeckillStateEnum;
import com.peng.seckill.seckillorder.entity.SeckillOrder;

/**
 * 封装秒杀执行的结果
 */
public class  SeckillExecution{
    //秒杀商品id
    private long seckillId;

    //秒杀用户id
    private String uid;

    //秒杀执行结果的状态
    private int state;

    //状态的明文标识
    private String stateInfo;

    //秒杀成功时，返回秒杀订单信息
    private SeckillOrder seckillOrder;

    //秒杀成功返回所有信息
    public SeckillExecution(long seckillId, String uid, SeckillStateEnum stateEnum, SeckillOrder seckillOrder) {
        this.seckillId = seckillId;
        this.uid = uid;
        this.state = stateEnum.getState();
        this.stateInfo = stateEnum.getInfo();
        this.seckillOrder = seckillOrder;
    }

    ////秒杀失败
    public SeckillExecution(long seckillId, String uid,SeckillStateEnum stateEnum ) {
        this.seckillId = seckillId;
        this.uid = uid;
        this.state = stateEnum.getState();
        this.stateInfo = stateEnum.getInfo();
    }

    public long getSeckillId() {
        return seckillId;
    }

    public void setSeckillId(long seckillId) {
        this.seckillId = seckillId;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }

    public SeckillOrder getSeckillOrder() {
        return seckillOrder;
    }

    public void setSeckillOrder(SeckillOrder seckillOrder) {
        this.seckillOrder = seckillOrder;
    }

    @Override
    public String toString() {
        return "SeckillExecution{" +
                "seckillId=" + seckillId +
                ", uid='" + uid + '\'' +
                ", state=" + state +
                ", stateInfo='" + stateInfo + '\'' +
                ", seckillOrder=" + seckillOrder +
                '}';
    }
}