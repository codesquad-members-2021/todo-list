package team_16.todolist.domain;

import org.springframework.data.annotation.Id;
import java.time.LocalDateTime;
public class Card {

    @Id
    private Long id;

    String title;
    String content;
    LocalDateTime createdTime;

    public Card(String title, String content, LocalDateTime createdTime) {
        this.title = title;
        this.content = content;
        this.createdTime = createdTime;
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

    public Card updateCard(Card updateCard) {
        this.title = updateCard.title;
        this.content = updateCard.content;

        return this;
    }


}
