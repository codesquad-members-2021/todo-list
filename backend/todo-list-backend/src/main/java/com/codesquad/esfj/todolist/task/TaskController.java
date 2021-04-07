package com.codesquad.esfj.todolist.task;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
public class TaskController {

    @GetMapping("/tasks")
    public List<Task> readAll() {
        return Arrays.asList(new Task(1L, "title1", "content1", "writer1"),
                new Task(2L, "title2", "content2", "writer2"),
                new Task(3L, "title3", "content3", "writer3"));
    }

    @GetMapping("/tasks/{id}")
    public Task readOne(@PathVariable Long id) {
        return new Task(id, "title", "content", "writer");
    }
}
