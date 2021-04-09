package com.codesquad.todoList.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@Table(value = "NOTE")
public class Note {

    @Id
    @Column(value = "ID")
    private Long id;

    @Column(value = "BEFORE_STATUS")
    private String beforeStatus;

    @Column(value = "AFTER_STATUS")
    private String afterStatus;

    private String title;

    private Action action;

    @Column(value = "CREATE_ACTION_DATETIME")
    private LocalDateTime createDateTime = LocalDateTime.now();

    public Note(String beforeStatus, String afterStatus, String title, Action action) {
        this.beforeStatus = beforeStatus;
        this.afterStatus = afterStatus;
        this.title = title;
        this.action = action;
    }

}
