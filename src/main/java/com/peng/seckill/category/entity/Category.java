package com.peng.seckill.category.entity;

/**
 * 商品分类实体类
 */
public class Category {
    private Long cid;

    private String cname;

    private String cdesc;

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCdesc() {
        return cdesc;
    }

    public void setCdesc(String cdesc) {
        this.cdesc = cdesc;
    }

    @Override
    public String toString() {
        return "Category{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                ", cdesc='" + cdesc + '\'' +
                '}';
    }
}