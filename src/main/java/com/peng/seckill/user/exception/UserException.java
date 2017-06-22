package com.peng.seckill.user.exception;

/**
 * Created by Peng
 * Time: 2017/4/18 19:17
 */
public class UserException extends RuntimeException {
    public UserException() {
        super();
    }

    public UserException(String message) {
        super(message);
    }

    public UserException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserException(Throwable cause) {
        super(cause);
    }
}
