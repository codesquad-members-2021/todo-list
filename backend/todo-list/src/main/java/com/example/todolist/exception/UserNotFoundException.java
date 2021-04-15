package com.example.todolist.exception;

public class UserNotFoundException extends ElementNotFoundException {

    public UserNotFoundException() {
        super("해당 아이디의 사용자가 존재하지 않습니다.");
    }

}
