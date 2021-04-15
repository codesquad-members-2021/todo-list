package team10.todolist.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import team10.todolist.dto.BoardDto;

import java.time.LocalDateTime;

public class Board {

    @Id
    private Long id;
    private String title;
    private String contents;
    private String category;

    @Column(value = "date_time")
    private LocalDateTime dateTime;
    @Column(value = "is_deleted")
    private int isDeleted = 0;

    protected Board() {
    }

    public Board(String title, String contents, String category) {
        this.title = title;
        this.contents = contents;
        this.category = category;
        this.dateTime = LocalDateTime.now();
    }

    public Long getId() {
        return id;
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

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public int getIsDeleted() {
        return isDeleted;
    }

    public void delete() {
        isDeleted = 1;
    }

    public void update(BoardDto boardDto) {
        this.title = boardDto.getTitle();
        this.category = boardDto.getCategory();
        this.contents = boardDto.getContents();
        this.dateTime = LocalDateTime.now();
    }

    public boolean checkBoardUpdateAction(BoardDto boardDto){
        return category.equals(boardDto.getCategory());
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", category='" + category + '\'' +
                ", dateTime='" + LocalDateTime.now().toString() + '\'' +
                ", isDeleted=" + isDeleted +
                '}';
    }
}
