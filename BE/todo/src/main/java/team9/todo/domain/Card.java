package team9.todo.domain;

import org.springframework.data.annotation.Id;

public class Card {
    @Id
    private Long id;

    private long user;

    private String title;

    private String content;

    private double priority;

    private String columnType;

    private boolean deleted;

    public Card(String title, String content, double priority, String columnType) {
        this.title = title;
        this.content = content;
        this.priority = priority;
        this.columnType = columnType;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public long getUser() {
        return user;
    }

    public void setUser(long user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public double getPriority() {
        return priority;
    }

    public void setPriority(double priority) {
        this.priority = priority;
    }

    public String getColumnType() {
        return columnType;
    }

    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public void update(Card card) {
        this.title = card.title;
        this.content = card.content;
        this.priority = card.priority;
        this.columnType = card.columnType;
    }
}
