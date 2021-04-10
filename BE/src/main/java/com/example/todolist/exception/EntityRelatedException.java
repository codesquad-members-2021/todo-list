package com.example.todolist.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class EntityRelatedException extends RuntimeException {

    public EntityRelatedException(ErrorMessage errorMessage) {
        super(errorMessage.getErrorMessage());
    }

}
