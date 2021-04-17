package com.codeSquad.cocokyu.domain.model;

public class Message {
    private static final String SUCCESS = "success";
    private final String result;

    public Message(String result) {
        this.result = result;
    }

    public static Message of() {
        return new Message(SUCCESS);
    }

    public String getResult() {
        return result;
    }
}
