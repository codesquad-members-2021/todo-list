package team10.todolist.dto;

import team10.todolist.domain.Card;

public class CardDto {
    private String title;
    private String contents;
    private String category;

    protected CardDto() {
    }

    public CardDto(String title, String contents, String category) {
        this.title = title;
        this.contents = contents;
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public String getContents() {
        return contents;
    }

    public String getCategory() {
        return category;
    }

    public Card toEntity() {
        return new Card(title, contents, category);
    }
}
