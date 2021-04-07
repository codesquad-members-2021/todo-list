package com.codesquad.esfj.todolist.task;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
public class TaskController {

    @GetMapping("/tasks")
    public List<Task> readAll() {
        return Arrays.asList(new Task("title1", "content1", "writer1"),
                new Task("title2", "content2", "writer2"),
                new Task("title3", "content3", "writer3"));
    }
}
