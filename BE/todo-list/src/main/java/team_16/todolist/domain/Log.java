package team_16.todolist.domain;

import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Log {

    @Id
    private Long id;

    private String action;
    private String  title;
    private LocalDateTime time;
    private String from;
    private String to;
}
