package com.codesquad.todoList.error.exception;

import com.codesquad.todoList.error.ErrorCode;
import lombok.Getter;

public class NotFoundColumnException extends NotFoundException {

    public NotFoundColumnException() {
        super(ErrorCode.COLUMN_NOT_FOUND);
    }

}
