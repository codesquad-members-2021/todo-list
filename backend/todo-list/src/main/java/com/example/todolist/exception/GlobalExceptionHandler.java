package com.example.todolist.exception;

import com.auth0.jwt.exceptions.JWTVerificationException;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    private MultiValueMap encodingUTF8(){
        MultiValueMap<String, String> headers = new HttpHeaders();
        headers.add("Content-Type", "text/html; charset=utf-8");
        return headers;
    }

    @ExceptionHandler({IllegalUserAccessException.class, ElementNotFoundException.class})
    protected ResponseEntity handleException(Exception e) {
        logger.error(e.getMessage());
        MultiValueMap headers = encodingUTF8();
        return new ResponseEntity(e.getMessage(), headers, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(JsonProcessingException.class)
    protected void handleJsonProcessingException(Exception e) {
        logger.error("Interceptor에서 Json으로 처리하는 중 문제가 발생했습니다.");
    }

    @ExceptionHandler(JWTVerificationException.class)
    protected void handleJWTVerificationException(Exception e) {
        logger.error("유효하지 않은 토큰입니다.");
    }
}
