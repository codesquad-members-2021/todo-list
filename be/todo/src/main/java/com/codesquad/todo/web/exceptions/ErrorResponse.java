package com.codesquad.todo.web.exceptions;

import org.springframework.validation.FieldError;

import java.util.List;

public class ErrorResponse {
    private String message;
    private int status;
    private List<FieldError> errors;
    private String code;
}
