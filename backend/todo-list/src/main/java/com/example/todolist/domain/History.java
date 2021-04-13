package com.example.todolist.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class History {
    public static final String DATETIME_FORMAT = "yyyy-MM-dd HH:mm";

    @Id
    private Long id;

    private Long cardId;
    private String action;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = DATETIME_FORMAT, timezone = "Asia/Seoul")
    private LocalDateTime actionTime;
    private String preStatus;
    private String currStatus;

    public History(){

    }

    public History(Card card, String action, String preStatus) {
        this.cardId = card.getId();
        this.action = action;
        this.preStatus = preStatus;
        this.currStatus = card.getStatus();
        this.actionTime = LocalDateTime.now();
    }

    public History(Card card, String action) {
        this.cardId = card.getId();
        this.action = action;
        this.preStatus = null;
        this.currStatus = card.getStatus();
        this.actionTime = LocalDateTime.now();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCardId() {
        return cardId;
    }

    public void setCardId(Long cardId) {
        this.cardId = cardId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public LocalDateTime getActionTime() {
        return actionTime;
    }

    public void setActionTime(LocalDateTime actionTime) {
        this.actionTime = actionTime;
    }

    public String getPreStatus() {
        return preStatus;
    }

    public void setPreStatus(String preStatus) {
        this.preStatus = preStatus;
    }

    public String getCurrStatus() {
        return currStatus;
    }

    public void setCurrStatus(String status) {
        this.currStatus = status;
    }

    @Override
    public String toString() {
        return "History{" +
                "id=" + id +
                ", cardId=" + cardId +
                ", action='" + action + '\'' +
                ", actionTime=" + actionTime +
                ", preStatus='" + preStatus + '\'' +
                ", currStatus='" + currStatus + '\'' +
                '}';
    }
}
