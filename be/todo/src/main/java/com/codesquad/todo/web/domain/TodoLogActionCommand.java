package com.codesquad.todo.web.domain;

public enum TodoLogActionCommand {
    ADD("add", 2),
    REMOVE("remove", 2),
    UPDATE("update", 2),
    MOVE("move", 3);

    private final String actionCommand;
    private final int numberOfRequiredArguments;

    TodoLogActionCommand(String actionCommand, int numberOfRequiredArguments) {
        this.actionCommand = actionCommand;
        this.numberOfRequiredArguments = numberOfRequiredArguments;
    }

    public String getActionCommand() {
        return actionCommand;
    }

    public int getNumberOfRequiredArguments() {
        return numberOfRequiredArguments;
    }
}
