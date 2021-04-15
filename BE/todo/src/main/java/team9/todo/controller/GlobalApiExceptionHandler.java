package team9.todo.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import team9.todo.domain.ApiResult;

@RestControllerAdvice
public class GlobalApiExceptionHandler {
    @ExceptionHandler({
            RuntimeException.class
    })
    @ResponseStatus(code = HttpStatus.BAD_REQUEST)
    public ApiResult notAuthorizedException(RuntimeException exception) {
        return ApiResult.failed(exception);
    }
}
