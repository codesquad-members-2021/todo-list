package com.codesquad.esfj.todolist.task;

/**
 * PreviousTask가 올바르지 않을 경우 발생. Task의 PreviousId로 올바르지 않은 값이 들어갈 경우 사용 가능.
 */
public class PreviousTaskNotAllowedException extends RuntimeException {
    public PreviousTaskNotAllowedException(String message) {
        super(message);
    }
}
