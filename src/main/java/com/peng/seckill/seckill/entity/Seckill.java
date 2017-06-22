package com.peng.seckill.seckill.entity;

import java.math.BigDecimal;
import java.util.Date;

/**
 *秒杀商品实体类
 */
public class Seckill {

    private Long seckillId;//主键

    private String sname;//名称

    private Integer numbers;//库存数量

    private Date startTime;//秒杀开始时间

    private Date endTime;//秒杀结束时间

    private Date createTime;//商品创建时间

    private String seckillDesc;//商品描述

    private BigDecimal price;//商品价格

    private Long cid;//所属分类id

    private String image;//图片地址

    public Long getSeckillId() {
        return seckillId;
    }

    public void setSeckillId(Long seckillId) {
        this.seckillId = seckillId;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public Integer getNumbers() {
        return numbers;
    }

    public void setNumbers(Integer numbers) {
        this.numbers = numbers;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getSeckillDesc() {
        return seckillDesc;
    }

    public void setSeckillDesc(String seckillDesc) {
        this.seckillDesc = seckillDesc;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Seckill{" +
                "seckillId=" + seckillId +
                ", sname='" + sname + '\'' +
                ", numbers=" + numbers +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", createTime=" + createTime +
                ", seckillDesc='" + seckillDesc + '\'' +
                ", price=" + price +
                ", cid=" + cid +
                ", image='" + image + '\'' +
                '}';
    }
}