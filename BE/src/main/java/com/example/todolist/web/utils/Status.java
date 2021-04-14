package com.example.todolist.web.utils;

public enum Status {

    TODO(1),
    DOING(2),
    DONE(3),
    DELETED(0);

    private final int code;

    Status(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
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
