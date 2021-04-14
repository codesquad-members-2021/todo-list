package com.example.todolist.domain.work;

import com.example.todolist.domain.user.User;
import com.example.todolist.web.utils.Status;
import lombok.*;
import org.springframework.data.annotation.Id;

import java.time.LocalDateTime;

@ToString
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Work {

    @Id
    private Long id;

    private String title;
    private String content;
    private LocalDateTime createdAt;
    private Status status;
    private Long authorId;

    public void saveAuthorId(User sessionUser) {
        this.authorId = sessionUser.getId();
    }

    public void update(Work work) {
        this.title = work.title;
        this.content = work.content;
    }

    public void delete() {
        this.status = Status.DELETED;
    }

    public void move(Status status) {
        this.status = status;
    }

    public boolean matchAuthor(User sessionUser) {
        return authorId.equals(sessionUser.getId());
    }

    public boolean isNotDeleted() {
        return this.status != Status.DELETED;
    }

}
