package com.example.todolist.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND)
public class EntityRelatedException extends RuntimeException {

    public EntityRelatedException(ErrorMessage errorMessage) {
        super(errorMessage.getErrorMessage());
    }

}
