package com.codesquad.todoList.error.exception;

import com.codesquad.todoList.error.ErrorCode;

public class NotFoundProjectException extends NotFoundException {

    public NotFoundProjectException() {
        super(ErrorCode.PROJECT_NOT_FOUND);
    }

}
