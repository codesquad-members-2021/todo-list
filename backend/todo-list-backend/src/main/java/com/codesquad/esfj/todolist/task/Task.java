package com.codesquad.esfj.todolist.task;

public class Task {

    private Long id;
    private String title;
    private String content;
    private String writer;

    public Task(Long id, String title, String content, String writer) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.writer = writer;
    }

    public Long getId() {
        return id;
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
