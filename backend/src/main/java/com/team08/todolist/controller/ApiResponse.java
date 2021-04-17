package com.team08.todolist.controller;

public class ApiResponse<T> {

    private final boolean success;

    private final T response;


    private ApiResponse(boolean success, T response) {
        this.success = success;
        this.response = response;
    }

    public static <T> ApiResponse<T> OK(T response){
        return new ApiResponse<>(true, response);
    }

    public static <T> ApiResponse<T> ERROR(T response){
        return new ApiResponse<>(false, response);
    }

    public boolean isSuccess() {
        return success;
    }

    public T getResponse() {
        return response;
    }

    @Override
    public String toString() {
        return "ApiResponse{" +
                "success=" + success +
                ", response=" + response +
                '}';
    }
}
