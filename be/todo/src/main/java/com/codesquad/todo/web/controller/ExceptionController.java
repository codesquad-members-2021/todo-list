package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.exceptions.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
public class ExceptionController {
    private static final Logger logger = LoggerFactory.getLogger(ExceptionController.class);

    private static final String ERROR_MESSAGE_NOT_FOUND = "리소스를 찾지 못했습니다!";
    private static final String ERROR_MESSAGE_LOG_ACTION_COMMAND_NOT_FOUND = "발생한 작업에 해당하는 로그 액션 커맨드를 찾지 못했습니다!";
    private static final String ERROR_MESSAGE_INVALID_ENTITY_DETECTED = "잘못된 엔티티가 발견되었습니다! 구성 문자열이 비어있습니다!";

    @ExceptionHandler({UserNotFoundException.class, TaskNotFoundException.class, ColumnNotFoundException.class})
    public void handlerNotFoundException(RuntimeException exception) {
        Map<String, Object> responseMap = new HashMap<>();
        logger.error(ERROR_MESSAGE_NOT_FOUND);
        logger.error(exception.getMessage());
    }

    @ExceptionHandler(IllegalActionCommandException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public void handlerIllegalActionCommandException(RuntimeException exception) {
        logger.error(ERROR_MESSAGE_LOG_ACTION_COMMAND_NOT_FOUND);
        logger.error(exception.getMessage());
    }

    @ExceptionHandler(InvalidEntityDetectedException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public void handlerInvalidEntityDetectedException(RuntimeException exception) {
        logger.error(ERROR_MESSAGE_INVALID_ENTITY_DETECTED);
        logger.error(exception.getMessage());
    }

}
