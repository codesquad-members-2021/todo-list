package team9.todo.domain;

import java.time.LocalDateTime;

public class HistoryWithCardTitle {

    private final String cardTitle;
    private final String action;
    private final LocalDateTime date;
    private final String from;
    private final String to;

    public HistoryWithCardTitle(String cardTitle, String action, LocalDateTime date, String from, String to) {
        this.cardTitle = cardTitle;
        this.action = action;
        this.date = date;
        this.from = from;
        this.to = to;
    }

    public String getCardTitle() {
        return cardTitle;
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
}
