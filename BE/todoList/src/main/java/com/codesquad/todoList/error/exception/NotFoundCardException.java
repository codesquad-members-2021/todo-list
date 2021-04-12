package com.codesquad.todoList.error.exception;

import com.codesquad.todoList.error.ErrorCode;
import lombok.Getter;

public class NotFoundCardException extends NotFoundException {

    public NotFoundCardException() {
        super(ErrorCode.CARD_NOT_FOUND);
    }
}
