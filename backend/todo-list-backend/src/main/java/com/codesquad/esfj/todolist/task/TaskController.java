package com.codesquad.esfj.todolist.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
public class TaskController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private TaskRepository taskRepository;

    public TaskController(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    @GetMapping("/tasks")
    public List<Task> readAll() {
        return taskRepository.findAllByNotDeleted();
    }

    @GetMapping("/tasks/{id}")
    public Task readOne(@PathVariable Long id) {
        return taskRepository.findOne(id);
    }

    @PostMapping("/tasks")
    @ResponseStatus(HttpStatus.CREATED)
    public Long create(@RequestBody Task task) {
        return taskRepository.save(task).getId();
    }

    @PutMapping("/tasks/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void update(@PathVariable Long id, @RequestBody Task updatedTask) {
        Task task = taskRepository.findOne(id).update(updatedTask);
        taskRepository.save(task);
    }

    @DeleteMapping("/tasks/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) {
        Task task = taskRepository.findOne(id).delete();
        taskRepository.save(task);
    }

    @PatchMapping("/tasks/{id}/{previousId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void move(@PathVariable Long id, @PathVariable Long previousId) {
        logger.debug(id + " Successfully moved to " + previousId);
    }
}
