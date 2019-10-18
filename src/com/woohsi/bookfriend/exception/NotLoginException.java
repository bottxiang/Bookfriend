package com.woohsi.bookfriend.exception;

public class NotLoginException extends Exception {
    private static final long serialVersionUID = 1L;

    public NotLoginException() {
        super();
    }

    public NotLoginException(String message) {
        super(message);
    }
}
