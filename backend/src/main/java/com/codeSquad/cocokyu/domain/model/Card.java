package com.codeSquad.cocokyu.domain.model;

import com.codeSquad.cocokyu.domain.annotation.ToDoStatusPattern;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Embedded;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

public class Card {
    @Id
    private Long id;

    @NotBlank
    @NotNull
    private String title;

    @NotBlank
    @NotNull
    private String contents;

    private LocalDateTime createDateTime;

    @ToDoStatusPattern
    private Status status;

    @Embedded.Nullable
    private Logs logs = new Logs();

    protected Card() {
    }

    public Card(String title, String contents, Status status) {
        this.title = title;
        this.contents = contents;
        this.status = status;
        this.createDateTime = LocalDateTime.now();
        logs.createLog(this);
    }

    public void modify(Card updateCard) {
        logs.updateLog(this, updateCard);
        this.title = updateCard.title;
        this.contents = updateCard.contents;
        this.status = updateCard.status;
    }

    public void delete() {
        logs.deleteLog(this);
        this.status = Status.DELETED;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContents() {
        return contents;
    }

    public Status getStatus() {
        return status;
    }

    public LocalDateTime getCreateDateTime() {
        return createDateTime;
    }


    public enum Status {
        TODO,
        DOING,
        DONE,
        DELETED
    }
}
