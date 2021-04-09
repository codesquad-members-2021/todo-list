package com.example.todolist.web.exception;

public class UserAccountException extends RuntimeException {
    private ErrorMessage errorMessage;

    public UserAccountException() {
        super(ErrorMessage.LOGIN_FAILED.getErrorMessage());
    }
}
