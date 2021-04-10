package com.example.todolist.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class UserAccountException extends RuntimeException {

    public UserAccountException(ErrorMessage errorMessage) {
        super(errorMessage.getErrorMessage());
    }

}
