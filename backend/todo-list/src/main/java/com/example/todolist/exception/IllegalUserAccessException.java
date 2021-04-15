package com.example.todolist.exception;

public class IllegalUserAccessException extends RuntimeException {
    public IllegalUserAccessException() {
        super("본인이 작성한 글만 수정 또는 삭제가 가능합니다.");
    }

    public IllegalUserAccessException(String message) {
        super(message);
    }
}
