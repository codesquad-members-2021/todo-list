package com.example.todolist;

public class Response {
    public enum Status { SUCCESS, FAIL };

    private Object data;
    private Status status;

    public Response(Object data, Status status) {
        this.data = data;
        this.status = status;
    }
}
