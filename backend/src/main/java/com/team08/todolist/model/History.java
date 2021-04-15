package com.team08.todolist.model;

import com.team08.todolist.DateTimeUtils;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table("HISTORY")
public class History {
    @Id
    private Long hid;
    private Integer cid;
    private String author;
    private String title;
    private String action;
    private String from;
    private String to;
    private LocalDateTime date;

    public History(Long hid, Integer cid, String author, String title, String action, String from, String to, LocalDateTime date) {
        this.hid = hid;
        this.cid = cid;
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

    public Integer getCid() {
        return cid;
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



