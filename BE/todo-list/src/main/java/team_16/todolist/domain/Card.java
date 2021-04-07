package team_16.todolist.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table("CARD")
public class Card {

    @Id
    private Long id;
    private String title;
    private String contents;
    private LocalDateTime createdTime;

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", create=" + createdTime +
                '}';
    }
}
