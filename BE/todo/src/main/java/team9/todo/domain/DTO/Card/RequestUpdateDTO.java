package team9.todo.domain.DTO.Card;

public class RequestUpdateDTO {
    private final String title;
    private final String content;

    public RequestUpdateDTO(String title, String content) {
        this.title = title;
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }
}
