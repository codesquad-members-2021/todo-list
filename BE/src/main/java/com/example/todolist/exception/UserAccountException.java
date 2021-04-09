package com.example.todolist.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.OK)
public class UserAccountException extends RuntimeException {

    private ErrorMessage errorMessage;

    public UserAccountException(ErrorMessage errorMessage) {
        super(errorMessage.getErrorMessage());
        this.errorMessage = errorMessage;
    }

}
