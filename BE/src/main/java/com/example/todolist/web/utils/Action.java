package com.example.todolist.web.utils;

public enum Action {

    SAVE (" 등록하였습니다."),
    UPDATE (" 수정하였습니다."),
    DELETE (" 삭제하였습니다."),
    MOVE (" 이동하였습니다.");

    private final String value;

    Action(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
