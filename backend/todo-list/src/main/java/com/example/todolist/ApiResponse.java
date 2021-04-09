package com.example.todolist;

public class ApiResponse {
    public enum Status { SUCCESS, FAIL };

    private Object data;
    private Status status;

    public ApiResponse(Object data, Status status) {
        this.data = data;
        this.status = status;
    }

    public Object getData() {
        return data;
    }

    public Status getStatus() {
        return status;
    }
}
