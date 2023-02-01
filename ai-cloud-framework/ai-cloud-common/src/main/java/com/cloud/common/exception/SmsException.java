package com.cloud.common.exception;

/**
 * Sms异常类
 *
 * @author ai-cloud
 */
public class SmsException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public SmsException(String msg) {
        super(msg);
    }

}
