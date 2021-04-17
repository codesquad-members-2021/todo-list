package com.codesquad.todo.web.exceptions;

public class TodoTaskNotFoundException extends RuntimeException {
    private static final String ERROR_MESSAGE_TASK_NOT_FOUND = "요청한 Task 리소스를 찾을 수 없습니다!";

    public TodoTaskNotFoundException() {
        super(ERROR_MESSAGE_TASK_NOT_FOUND);
    }
}
