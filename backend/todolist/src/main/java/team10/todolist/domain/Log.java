package team10.todolist.domain;

import org.springframework.data.annotation.Id;

public class Log {
    @Id
    private Long id;
    private String title;
    private String category;
    private String action;

}
