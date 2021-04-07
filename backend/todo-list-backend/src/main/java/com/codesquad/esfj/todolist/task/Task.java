package com.codesquad.esfj.todolist.task;

public class Task {

    private String title;
    private String content;
    private String writer;

    public Task(String title, String content, String writer) {
        this.title = title;
        this.content = content;
        this.writer = writer;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getWriter() {
        return writer;
    }
}
