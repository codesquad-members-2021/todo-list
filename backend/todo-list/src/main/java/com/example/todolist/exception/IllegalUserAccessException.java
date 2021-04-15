package com.example.todolist.exception;

public class IllegalUserAccessException extends RuntimeException{
    public IllegalUserAccessException(String message) {
        super(message);
    }
}
