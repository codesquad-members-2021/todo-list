package com.example.todolist.exception;

public class UserAccountException extends RuntimeException {

    private ErrorMessage errorMessage;

    public UserAccountException(ErrorMessage errorMessage) {
        super(ErrorMessage.LOGIN_FAILED.getErrorMessage());
        this.errorMessage = errorMessage;
    }

}
