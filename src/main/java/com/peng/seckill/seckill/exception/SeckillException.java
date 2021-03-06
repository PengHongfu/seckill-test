package com.peng.seckill.seckill.exception;

/**
 * 秒杀相关的所有业务异常
 * Created by Peng
 * Time: 2017/4/20 10:36
 */
public class SeckillException extends RuntimeException{

    public SeckillException(String message) {
        super(message);
    }

    public SeckillException(String message, Throwable cause) {
        super(message, cause);
    }
}
