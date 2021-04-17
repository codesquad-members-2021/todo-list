package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.exceptions.ColumnNotFoundException;
import com.codesquad.todo.web.exceptions.IllegalActionCommandException;
import com.codesquad.todo.web.exceptions.TaskNotFoundException;
import com.codesquad.todo.web.exceptions.UserNotFoundException;
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

    private static final String ERROR_MESSAGE_NOT_FOUND = "리소스를 찾지 못했습니다!";
    private static final String ERROR_MESSAGE_LOG_ACTION_COMMAND_NOT_FOUND = "발생한 작업에 해당하는 로그 액션 커맨드를 찾지 못했습니다!";
    private static final String ERROR_MESSAGE_INVALID_ENTITY_DETECTED = "잘못된 엔티티가 발견되었습니다! 구성 문자열이 비어있습니다!";

    @ExceptionHandler({UserNotFoundException.class, TaskNotFoundException.class, ColumnNotFoundException.class})
    public ResponseEntity<ErrorDto> handlerNotFoundException(RuntimeException exception) {
        logger.error(ERROR_MESSAGE_NOT_FOUND);
        logger.error(exception.getMessage());
        return createErrorResponse(exception);
    }

    @ExceptionHandler(IllegalActionCommandException.class)
    public ResponseEntity<ErrorDto> handlerIllegalActionCommandException(IllegalActionCommandException exception) {
        logger.error(ERROR_MESSAGE_LOG_ACTION_COMMAND_NOT_FOUND);
        logger.error(exception.getMessage());
        return createErrorResponse(exception);
    }

    @ExceptionHandler(BindException.class)
    public ResponseEntity<ErrorDto> handlerInvalidEntityDetectedException(BindException exception) {
        logger.error(ERROR_MESSAGE_INVALID_ENTITY_DETECTED);
        logger.error(exception.getMessage());
        return createErrorResponse(exception);
    }

    private ResponseEntity<ErrorDto> createErrorResponse(Exception exception) {
        ErrorDto errorDto = new ErrorDto(exception.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorDto);
    }
}
