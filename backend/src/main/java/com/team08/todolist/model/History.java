package com.team08.todolist.model;

import com.team08.todolist.util.DateTimeUtils;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table("HISTORY")
public class History {
    @Id
    private Long hid;
    private String author;
    private String title;
    private String action;
    private String from;
    private String to;
    private LocalDateTime date;

    public History(Long hid, String author, String title, String action, String from, String to, LocalDateTime date) {
        this.hid = hid;
        this.author = author;
        this.title = title;
        this.action = action;
        this.from = from;
        this.to = to;
        this.date = date;
    }

    public Long getHid() {
        return hid;
    }

    public String getAuthor() {
        return author;
    }

    public String getTitle() {
        return title;
    }

    public String getAction() {
        return action;
    }

    public String getFrom() {
        return from;
    }

    public String getTo() {
        return to;
    }

    public String getDate() {
        return DateTimeUtils.formatByPattern(date);
    }

}



