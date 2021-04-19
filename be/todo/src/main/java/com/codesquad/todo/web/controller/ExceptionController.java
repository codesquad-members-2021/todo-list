package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.exceptions.TodoColumnNotFoundException;
import com.codesquad.todo.web.exceptions.IllegalActionCommandException;
import com.codesquad.todo.web.exceptions.TodoTaskNotFoundException;
import com.codesquad.todo.web.exceptions.TodoUserNotFoundException;
import com.codesquad.todo.web.service.dto.ErrorDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {
    private static final Logger logger = LoggerFactory.getLogger(ExceptionController.class);

    @ExceptionHandler({TodoUserNotFoundException.class, TodoTaskNotFoundException.class, TodoColumnNotFoundException.class})
    public ResponseEntity<ErrorDto> handlerNotFoundException(RuntimeException exception) {
        logger.error(exception.getMessage());
        return createErrorResponse(exception);
    }

    @ExceptionHandler(IllegalActionCommandException.class)
    public ResponseEntity<ErrorDto> handlerIllegalActionCommandException(IllegalActionCommandException exception) {
        logger.error(exception.getMessage());
        return createErrorResponse(exception);
    }

    @ExceptionHandler(BindException.class)
    public ResponseEntity<ErrorDto> handlerInvalidEntityDetectedException(BindException exception) {
        logger.error(exception.getMessage());
        return createErrorResponse(exception);
    }

    private ResponseEntity<ErrorDto> createErrorResponse(Exception exception) {
        ErrorDto errorDto = new ErrorDto(exception.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorDto);
    }
}
