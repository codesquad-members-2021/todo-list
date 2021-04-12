package team10.todolist.dto;

import team10.todolist.domain.Board;

public class BoardDto {
    private String title;
    private String contents;
    private String category;

    protected BoardDto() {
    }

    public BoardDto(String title, String contents, String category) {
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

    public Board toEntity() {
        return new Board(title, contents, category);
    }
}
