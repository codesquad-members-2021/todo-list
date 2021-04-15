package team9.todo.domain.DTO.Card;

import team9.todo.domain.Card;
import team9.todo.domain.enums.CardColumn;

public class ResponseDTO {
    private Long id;

    private String title;

    private String content;

    private double priority;

    private CardColumn columnType;

    private boolean deleted;

    private boolean rebalanced;

    private ResponseDTO(Long id, String title, String content, double priority, CardColumn columnType, boolean deleted, boolean rebalanced) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.priority = priority;
        this.columnType = columnType;
        this.deleted = deleted;
        this.rebalanced = rebalanced; // 클라이언트에서 true 일때 카드목록을 전체 다 불러와야함.
    }

    public static ResponseDTO of(Card entity, boolean rebalanced) {
        return new ResponseDTO(entity.getId(), entity.getTitle(),
                entity.getContent(), entity.getPriority(),
                entity.getColumnType(), entity.isDeleted(), rebalanced);
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public double getPriority() {
        return priority;
    }

    public CardColumn getColumnType() {
        return columnType;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public boolean isRebalanced() {
        return rebalanced;
    }
}
