package com.example.todolist.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND)
public class EntityNotCreateException extends RuntimeException {

    public EntityNotCreateException() {
        super(ErrorMessage.ENTITY_NOT_CREATE.getErrorMessage());
    }

}
