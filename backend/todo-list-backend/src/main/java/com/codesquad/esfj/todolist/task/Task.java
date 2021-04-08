package com.codesquad.esfj.todolist.task;

public class Task {
    public static final long TOP_PREVIOUS_ID = -1L;

    private Long id;
    private String title;
    private String content;
    private String writer;
    private boolean deleted;
    private Long previousId = TOP_PREVIOUS_ID;

    public Task(Long id, String title, String content, String writer) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.writer = writer;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Long getPreviousId() {
        return previousId;
    }

    public void moveAfter(Long previousId) {
        this.previousId = previousId;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public Task update(Task updatedTask) {
        this.title = updatedTask.title;
        this.content = updatedTask.content;
        this.writer = updatedTask.writer;
        return this;
    }

    public Task delete() {
        deleted = true;
        return this;
    }

    public boolean isTop() {
        return (id.equals(TOP_PREVIOUS_ID));
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", writer='" + writer + '\'' +
                '}';
    }
}
