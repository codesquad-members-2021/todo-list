package team_16.todolist.domain;

import org.springframework.data.annotation.Id;
import java.time.LocalDateTime;

public class Card {

    @Id
    private Long id;

    private String title;
    private String content;
    private LocalDateTime createdTime;

    public Card(String title, String content) {
        this.title = title;
        this.content = content;
        this.createdTime = LocalDateTime.now();
    }

    public Long getId() {
        return id;
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

    public LocalDateTime getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(LocalDateTime createdTime) {
        this.createdTime = createdTime;
    }

    public Card updateCard(String title, String content) {//card객체를 받는걸로 수
        this.title = title;
        this.content = content;

        return this;
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", createdTime=" + createdTime +
                '}';
    }
}
