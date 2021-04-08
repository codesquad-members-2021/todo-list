package codesquad.TodoList.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Card {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 500)
    private String title;

    private String contents;

    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime dateTime = LocalDateTime.now();

    private boolean todo;
    private boolean doing;
    private boolean done;
    private boolean deleted;

    public void update(Card card) {
        this.title = card.title;
        this.contents = card.contents;
    }

    public void changeStateTodo() {
        this.todo = true;
        this.doing = false;
        this.done = false;
    }

    public void changeStateDoing() {
        this.todo = false;
        this.doing = true;
        this.done = false;
    }

    public void changeStateDone() {
        this.todo = false;
        this.doing = false;
        this.done = true;
    }

    public void delete() {
        this.deleted = true;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime createDate) {
        this.dateTime = createDate;
    }

    public boolean isTodo() {
        return todo;
    }

    public boolean isDoing() {
        return doing;
    }

    public boolean isDone() {
        return done;
    }

    public boolean isDeleted() {
        return deleted;
    }

    @Override
    public String toString() {
        return "Card{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", dateTime=" + dateTime +
                ", todo=" + todo +
                ", doing=" + doing +
                ", done=" + done +
                '}';
    }
}
