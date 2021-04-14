package com.team08.todolist.model;

import com.team08.todolist.DateTimeUtils;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

public class Card {
    @Id
    private Long cid;
    private String author;
    private String title;
    private String content;
    private LocalDateTime date;
    private boolean isapp;
    private Long columnid;
    private Integer pos;

    public Card(Long cid, String author, String title, String content, LocalDateTime date, boolean isapp, Long columnid, Integer pos) {
        this.cid = cid;
        this.author = author;
        this.title = title;
        this.content = content;
        this.date = date;
        this.isapp = isapp;
        this.columnid = columnid;
        this.pos = pos;
    }

    public Long getCid() {
        return cid;
    }

    public String getAuthor() {
        return author;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getDate() {
        return DateTimeUtils.formatByPattern(date);
    }

    public boolean getIsapp() {
        return isapp;
    }

    public Long getColumnid() {
        return columnid;
    }

    public Integer getPos() {
        return pos;
    }
    
    @Override
    public String toString() {
        return "Card{" +
                "cid=" + cid +
                ", author='" + author + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", date=" + date +
                ", isapp=" + isapp +
                ", columnid=" + columnid +
                ", pos=" + pos +
                '}';
    }
}