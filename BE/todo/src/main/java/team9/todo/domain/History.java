package team9.todo.domain;

import org.springframework.data.annotation.Id;
import team9.todo.domain.enums.CardColumn;
import team9.todo.domain.enums.HistoryAction;

import java.time.LocalDateTime;

public class History {

    @Id
    private Long id;

    private long card;

    private HistoryAction action;

    private LocalDateTime date;

    private CardColumn from;

    private CardColumn to;

    private boolean deleted;

    public History(long card, HistoryAction action, CardColumn from, CardColumn to) {
        this.card = card;
        this.action = action;
        this.date = LocalDateTime.now();
        this.from = from;
        this.to = to;
    }

    public long getCard() {
        return card;
    }

    public HistoryAction getAction() {
        return action;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public CardColumn getFrom() {
        return from;
    }

    public CardColumn getTo() {
        return to;
    }

    public boolean isDeleted() {
        return deleted;
    }
}
