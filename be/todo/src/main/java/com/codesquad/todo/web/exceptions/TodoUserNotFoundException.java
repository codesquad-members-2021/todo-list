package com.codesquad.todo.web.exceptions;

public class TodoUserNotFoundException extends RuntimeException {
    private static final String ERROR_MESSAGE_USER_NOT_FOUND = "요청한 User 리소스를 찾을 수 없습니다!";

    public TodoUserNotFoundException() {
        super(ERROR_MESSAGE_USER_NOT_FOUND);
    }
}
