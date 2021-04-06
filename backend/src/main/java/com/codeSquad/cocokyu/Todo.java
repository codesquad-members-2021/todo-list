package com.codeSquad.cocokyu;

import org.springframework.data.annotation.Id;

public class Todo {
    @Id
    private Long id;

    private String title;
    private String contents;
    private String status;

    public Todo(String title, String contents, String status) {
        this.title = title;
        this.contents = contents;
        this.status = status;
    }
}
