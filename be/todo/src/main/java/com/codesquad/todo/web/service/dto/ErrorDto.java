package com.codesquad.todo.web.service.dto;

public class ErrorDto {
    private String reason;

    public ErrorDto(String reason) {
        this.reason = reason;
    }

    public String getReason() {
        return reason;
    }
}
