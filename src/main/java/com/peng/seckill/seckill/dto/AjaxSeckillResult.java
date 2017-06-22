package com.peng.seckill.seckill.dto;

/**
 * ajax返回信息的类，相当于分页的实体类PageBean
 * Created by Peng
 * Time: 2017/4/21 17:31
 */
public class AjaxSeckillResult<T> {

    //请求是否成功
    private boolean success;
    //泛型的数据
    private T data;
    //错误
    private String error;

    public AjaxSeckillResult(boolean success, T data) {
        this.success = success;
        this.data = data;
    }

    public AjaxSeckillResult(boolean success, String error) {
        this.success = success;
        this.error = error;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
}