package team10.todolist.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;

import java.time.LocalDateTime;

public class Log {
    @Id
    private Long id;
    private String title;
    private String category;
    private String action;
    //Action Item = {"add","remove","update","move"}
    @Column(value = "date_time")
    private LocalDateTime dateTime;
}
