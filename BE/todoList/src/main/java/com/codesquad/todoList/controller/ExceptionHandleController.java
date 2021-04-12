package com.codesquad.todoList.controller;

import com.codesquad.todoList.error.ErrorCode;
import com.codesquad.todoList.error.ErrorResponse;
import com.codesquad.todoList.error.exception.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionHandleController {

    public static final Logger log = LoggerFactory.getLogger(ExceptionHandleController.class);

    /**
     * Client 에서 요청한 Entity 를 찾지 못했을때, NotFoundException 이 발생한다.
     * @param e
     * @return Response Entity 의 ErrorCode 와 404 HttpStatus
     */
    @ExceptionHandler(NotFoundException.class)
    public ResponseEntity<?> notFoundEntity(NotFoundException e) {
        log.error("ERROR : {}", e.getMessage());
        ErrorCode errorCode = e.getErrorCode();
        return new ResponseEntity<>(ErrorResponse.of(errorCode), errorCode.getHttpStatus());
    }

}
