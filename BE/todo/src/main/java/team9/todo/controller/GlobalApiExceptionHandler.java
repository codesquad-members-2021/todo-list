package team9.todo.controller;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import team9.todo.domain.ApiResult;
import team9.todo.exception.NotAuthorizedException;

@RestControllerAdvice
public class GlobalApiExceptionHandler {
    @ExceptionHandler(NotAuthorizedException.class)
    public ApiResult notAuthorizedException(NotAuthorizedException exception) {
        return ApiResult.failed(exception);
    }
}
