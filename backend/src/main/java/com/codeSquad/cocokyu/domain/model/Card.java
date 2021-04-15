package com.codeSquad.cocokyu.domain.model;

import com.codeSquad.cocokyu.domain.dto.CardDto;
import com.fasterxml.jackson.annotation.JsonIgnore;
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

    @NotNull
    private Status status;

    @JsonIgnore
    @Embedded.Nullable
    private Logs logs = new Logs();

//    private double priority;
    //TODO : ios와 협의

    private LocalDateTime createDateTime;

    protected Card() {
    }

    public Card(CardDto cardDto) {
        this.title = cardDto.getTitle();
        this.contents = cardDto.getContents();
        this.status = cardDto.getStatus();
        this.createDateTime = LocalDateTime.now();
        logs.createLog(this);
    }

    public void modify(CardDto updateCardDto) {
        logs.updateLog(this, updateCardDto);
        this.title = updateCardDto.getTitle();
        this.contents = updateCardDto.getContents();
        this.status = updateCardDto.getStatus();
    }

    @JsonIgnore
    public boolean isTodo() {
        return status == Status.TODO;
    }

    @JsonIgnore
    public boolean isDoing() {
        return status == Status.DOING;
    }

    @JsonIgnore
    public boolean isDone() {
        return status == Status.DONE;
    }

    public boolean checkSameStatus(Status status) {
        return this.status == status;
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

    public Logs getLogs() {
        return logs;
    }

}
