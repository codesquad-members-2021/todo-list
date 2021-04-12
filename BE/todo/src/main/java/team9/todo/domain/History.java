package team9.todo.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class History {

    @Id
    private Long id;

    private long card;

    private String action;

    private LocalDateTime date;

    private String from;

    private String to;

    private boolean deleted;

    public History(long card, String action, LocalDateTime date, String from, String to) {
        this.card = card;
        this.action = action;
        this.date = date;
        this.from = from;
        this.to = to;
    }

    public Long getId() {
        return id;
    }

    public long getCard() {
        return card;
    }

    public String getAction() {
        return action;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public String getFrom() {
        return from;
    }

    public String getTo() {
        return to;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setCard(long card) {
        this.card = card;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
