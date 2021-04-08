package com.codesquad.esfj.todolist.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
public class TaskController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

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

    @PostMapping("/tasks")
    @ResponseStatus(HttpStatus.CREATED)
    public Long create(@RequestBody Task task) {
        logger.debug(task.toString());
        return 1L;
    }

    @PutMapping("/tasks/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void update(@PathVariable Long id, @RequestBody Task updatedTask) {
        logger.debug(id + updatedTask.toString());
    }

    @DeleteMapping("/tasks/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        logger.debug(id + " Successfully deleted");
    }
}
