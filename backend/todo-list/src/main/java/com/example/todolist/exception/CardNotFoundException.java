package com.example.todolist.exception;

public class CardNotFoundException extends ElementNotFoundException {
    public CardNotFoundException() {
        super("해당 아이디의 카드가 존재하지 않습니다.");
    }
}
