package com.example.demo.exception;

/**
 * @class DuplicateValidateException
 * @extends RuntimeException
 * 설명 : 회원 중복 검사를 하기 위한 Exception class 이다.
 */
public class DuplicateValidateException extends RuntimeException {
    public DuplicateValidateException(){
        super();
    }

    public DuplicateValidateException(String message){
        super(message);
    }

    public DuplicateValidateException(String message, Throwable cause){
        super(message, cause);
    }

    public DuplicateValidateException(Throwable cause){
        super(cause);
    }
}
