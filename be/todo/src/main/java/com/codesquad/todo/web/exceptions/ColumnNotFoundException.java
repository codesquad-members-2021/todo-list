package com.codesquad.todo.web.exceptions;

public class ColumnNotFoundException extends RuntimeException {
    private static final String ERROR_MESSAGE_COLUMN_NOT_FOUND = "요청한 Column 리소스를 찾을 수 없습니다!";

    public ColumnNotFoundException() {
        super(ERROR_MESSAGE_COLUMN_NOT_FOUND);
    }
}
