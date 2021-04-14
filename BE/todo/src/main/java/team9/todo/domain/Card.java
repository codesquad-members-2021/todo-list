package team9.todo.domain;

import org.springframework.data.annotation.Id;
import team9.todo.domain.enums.CardColumn;

public class Card {
    public static final double PRIORITY_STEP = 1.0;

    @Id
    private Long id;

    private long user;

    private String title;

    private String content;

    private double priority;

    private CardColumn columnType;

    private boolean deleted;

    public Card(Long user, String title, String content, double priority, CardColumn columnType) {
        this.user = user;
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

    public CardColumn getColumnType() {
        return columnType;
    }

    public void setColumnType(CardColumn columnType) {
        this.columnType = columnType;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

    public void update(String title, String content) {
        this.title = title;
        this.content = content;
    }
}
