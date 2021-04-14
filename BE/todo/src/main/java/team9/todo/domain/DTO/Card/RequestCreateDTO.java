package team9.todo.domain.DTO.Card;

import team9.todo.domain.enums.CardColumn;

public class RequestCreateDTO {
    private final String title;

    private final String content;

    private final CardColumn columnType;

    public RequestCreateDTO(String title, String content, CardColumn columnType) {
        this.title = title;
        this.content = content;
        this.columnType = columnType;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public CardColumn getColumnType() {
        return columnType;
    }
}
