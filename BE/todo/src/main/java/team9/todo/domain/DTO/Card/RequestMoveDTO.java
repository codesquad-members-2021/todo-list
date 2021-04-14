package team9.todo.domain.DTO.Card;

import team9.todo.domain.enums.CardColumn;

public class RequestMoveDTO {

    private final Long prevCardId;
    private final Long nextCardId;
    private final CardColumn to;

    public RequestMoveDTO(Long prevCardId, Long nextCardId, CardColumn to) {
        this.prevCardId = prevCardId;
        this.nextCardId = nextCardId;
        this.to = to;
    }

    public Long getPrevCardId() {
        return prevCardId;
    }

    public Long getNextCardId() {
        return nextCardId;
    }

    public CardColumn getTo() {
        return to;
    }
}
