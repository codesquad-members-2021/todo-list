package mj_cooper.backend.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Todo {

    @Id
    private Long id;
    private int vertical;
    private String title;

    public Todo() {
    }

    public Todo(String title) {
        this.title = title;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "Todo{" +
                "id=" + id +
                ", column=" + vertical +
                ", title='" + title + '\'' +
                '}';
    }
}

