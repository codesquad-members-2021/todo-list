package com.codesquad.todo.web.exceptions;

public class InvalidEntityDetectedException extends RuntimeException {
    public static final String COLUMN_TITLE_IS_NULL = "칼럼 제목이 비어있습니다.";
    public static final String TASK_IS_NULL = "태스크 제목 또는 내용이 비어있습니다.";

    public InvalidEntityDetectedException(String message) {
        super(message);
    }
}
