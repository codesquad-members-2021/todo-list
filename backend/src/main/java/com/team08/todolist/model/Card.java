package com.team08.todolist.model;

import com.team08.todolist.util.DateTimeUtils;
import com.team08.todolist.dto.CardDto;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table("CARD")
public class Card {
    @Id
    private Long cid;
    private String author;
    private String title;
    private String content;
    private LocalDateTime date;
    private boolean isApp;
    private Long columnId;
    private Integer pos;

    private Card(Long cid, String author, String title, String content, LocalDateTime date, boolean isApp, Long columnId, Integer pos) {
        this.cid = cid;
        this.author = author;
        this.title = title;
        this.content = content;
        this.date = date;
        this.isApp = isApp;
        this.columnId = columnId;
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

    public LocalDateTime getDate() {
        return date;
    }

    public boolean isApp() {
        return isApp;
    }

    public Long getColumnId() {
        return columnId;
    }

    public Integer getPos() {
        return pos;
    }

    public void update(CardDto cardToUpdate) {
        this.cid = cardToUpdate.getCardId();
        this.title = cardToUpdate.getTitle();
        this.content = cardToUpdate.getContent();
        this.date = DateTimeUtils.reformatByPattern(cardToUpdate.getCreatedTime());
        this.isApp = cardToUpdate.getIsApp();
        this.columnId = cardToUpdate.getColumnId();
        this.pos = cardToUpdate.getPosition();
    }

    @Override
    public String toString() {
        return "Card{" +
                "cid=" + cid +
                ", author='" + author + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", date=" + date +
                ", isApp=" + isApp +
                ", columnId=" + columnId +
                ", pos=" + pos +
                '}';
    }

    public static Builder build(Long cardId, Integer position, Long columnId) {
        return new Builder(cardId, position, columnId);
    }

    static public class Builder {

        private Long cid;
        private String author = "august17";
        private String title = "no title";
        private String content = "no contents";
        private LocalDateTime date = LocalDateTime.now();
        private boolean isApp = true;
        private Long columnId;
        private Integer pos;

        private Builder(Long cid, Integer pos, Long columnId) {
            this.cid = cid;
            this.pos = pos;
            this.columnId = columnId;
        }

        public Builder author(String author){
            this.author = author;
            return this;
        }

        public Builder title(String title) {
            this.title = title;
            return this;
        }

        public Builder content(String content) {
            this.content = content;
            return this;
        }

        public Builder isApp(boolean isApp) {
            this.isApp = isApp;
            return this;
        }

        public Builder date(LocalDateTime date) {
            this.date = date;
            return this;
        }

        public Card build() {
            return new Card(cid, author, title, content, date, isApp, columnId, pos);
        }
    }
}