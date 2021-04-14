package team9.todo.domain.DTO.Card;

public class RequestMoveDTO {

    private final Long prevCardId;
    private final Long nextCardId;

    public RequestMoveDTO(Long prevCardId, Long nextCardId) {
        this.prevCardId = prevCardId;
        this.nextCardId = nextCardId;
    }

    public Long getPrevCardId() {
        return prevCardId;
    }

    public Long getNextCardId() {
        return nextCardId;
    }
}
