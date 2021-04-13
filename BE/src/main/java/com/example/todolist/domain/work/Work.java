package com.example.todolist.domain.work;

import com.example.todolist.domain.user.User;
import lombok.Getter;
import lombok.ToString;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

@ToString
@Getter
public class Work {

    @Id
    private Long id;

    private String title;

    private String content;

    private LocalDateTime createdAt;

    private int status;

    private Long authorId;

    public Work() {}

    public Work(String title, String content, int status) {
        this.title = title;
        this.content = content;
        this.createdAt = LocalDateTime.now();
        this.status = status;
    }

    public Work(String title, String content) {
        this.title = title;
        this.content = content;
    }

    public Work(int status) {
        this.status = status;
    }

    public void save(User sessionUser) {
        this.authorId = sessionUser.getId();
    }

    public void update(Work work) {
        this.title = work.title;
        this.content = work.content;
    }

    public void delete() {
        this.status = 0;
    }

    public void move(Work work) {
        this.status = work.status;
    }

    public boolean matchAuthor(User sessionUser) {
        return authorId.equals(sessionUser.getId());
    }

    public boolean isNotDeleted() {
        return this.status != 0;
    }

}
