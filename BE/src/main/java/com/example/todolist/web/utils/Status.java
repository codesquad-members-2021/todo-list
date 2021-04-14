package com.example.todolist.web.utils;

public enum Status {

    TODO(1, "해야할 일"),
    DOING(2, "하고 있는 일"),
    DONE(3, "완료한 일"),
    DELETED(0, "삭제된 일");

    private final int code;
    private final String comment;

    Status(int code, String comment) {
        this.code = code;
        this.comment = comment;
    }

    public int getCode() {
        return code;
    }

    public String getComment() {
        return comment;
    }

    public static Status makeStatusByCode(int code) {
        switch(code) {
            case 1 :
                return Status.TODO;
            case 2 :
                return Status.DOING;
            case 3 :
                return Status.DONE;
            default :
                return Status.DELETED;
        }
    }

}
