package team9.todo.controller;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import team9.todo.domain.ApiResult;
import team9.todo.exception.NotAuthorizedException;
import team9.todo.exception.NotFoundException;

@RestControllerAdvice
public class GlobalApiExceptionHandler {
    @ExceptionHandler({
            NotAuthorizedException.class,
            NotFoundException.class
    })
    public ApiResult notAuthorizedException(RuntimeException exception) {
        return ApiResult.failed(exception);
    }
}
