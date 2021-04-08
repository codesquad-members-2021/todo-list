package codesquad.TodoList.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Entity
public class Card {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonProperty
    private Long id;

    @JsonProperty
    private String title;

    @JsonProperty
    private String contents;

    @JsonProperty
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss", timezone = "Asia/Seoul")
    private LocalDateTime dateTime = LocalDateTime.now();

    private boolean todo;
    private boolean doing;
    private boolean done;

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

    public void setTodo(boolean todo) {
        this.todo = todo;
    }

    public boolean isDoing() {
        return doing;
    }

    public void setDoing(boolean doing) {
        this.doing = doing;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
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
