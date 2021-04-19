package com.team08.todolist.controller;

public class ApiResponse<T> {

    private final T response;

    private final String message;

    private ApiResponse(T response, String message) {
        this.response = response;
        this.message = message;
    }

    public static <T> ApiResponse<T> OK(T response, String message) {
        return new ApiResponse<>(response, message);
    }

    public static <T> ApiResponse<T> OK(T response) {
        return OK(response, "success");
    }

    public static <T> ApiResponse<T> ERROR(T response, String message) {
        return new ApiResponse<>(response, message);
    }

    public static <T> ApiResponse<T> ERROR(T response) {
        return new ApiResponse<>(response, "error");
    }

    public T getResponse() {
        return response;
    }

    public String getMessage() {
        return message;
    }

    @Override
    public String toString() {
        return "ApiResponse{" +
                "response=" + response +
                ", message='" + message + '\'' +
                '}';
    }
}
