package team10.todolist.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Card {


    @Id
    Long id;

    String title;
    String contents;
    String category;
    public String author;
    LocalDateTime createdDateTime;//@Todo 마지막 수정시간이 필요할까?
    boolean isDeleted;

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", category='" + category + '\'' +
                ", author='" + author + '\'' +
                ", createdDateTime=" + createdDateTime +
                ", isDeleted=" + isDeleted +
                '}';
    }
}
