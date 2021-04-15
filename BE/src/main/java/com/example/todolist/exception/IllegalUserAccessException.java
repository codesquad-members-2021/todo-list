package com.example.todolist.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.UNAUTHORIZED)
public class IllegalUserAccessException extends RuntimeException {

    public IllegalUserAccessException(String errorMessage) {
        super(errorMessage);
    }

    public IllegalUserAccessException() {
        super(ErrorMessage.INVALID_USER.getErrorMessage());
    }

}
