package team10.todolist.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;

import java.time.LocalDateTime;

public class Log {
    @Id
    private Long id;
    private String title;
    private String category;
    private Action action;
    //Action Item = {"add","remove","update","move"}
    @Column(value = "date_time")
    private LocalDateTime dateTime;

    protected Log(){
    }

    public Log(Board board, Action action){
        this.title = board.getTitle();
        this.category = board.getCategory();
        this.action = action;
        this.dateTime = board.getDateTime();
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getCategory() {
        return category;
    }

    public Action getAction() {
        return action;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }
}
