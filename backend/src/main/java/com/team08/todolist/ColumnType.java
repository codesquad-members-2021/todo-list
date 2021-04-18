package com.team08.todolist;

public enum ColumnType {

    TODO("ToDo"),
    DOING("Doing"),
    DONE("Done");

    private final String columnType;

    ColumnType(String columnType) {
        this.columnType = columnType;
    }

    public static String type(Long columnId) {
        if (columnId == 1L) {
            return TODO.getValue();
        } else if (columnId == 2L) {
            return DOING.getValue();
        }
        return DONE.getValue();
    }

    public String getValue() {
        return columnType;
    }
}
