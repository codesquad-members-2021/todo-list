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
        Task topTask = taskRepository.findOneByPreviousId(Task.TOP_PREVIOUS_ID);
        long id = taskRepository.save(task).getId();

        topTask.moveAfter(id);
        taskRepository.save(topTask);

        return id;
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

    @PatchMapping("/tasks/{id}/{targetId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void move(@PathVariable Long id, @PathVariable Long targetId) {
        Task taskToMove = taskRepository.findOne(id);
        Task originalNextTask = taskRepository.findOneByPreviousId(id);
        Task newNextTask = taskRepository.findOneByPreviousId(targetId);

        originalNextTask.moveAfter(taskToMove.getPreviousId());
        taskToMove.moveAfter(newNextTask.getPreviousId());
        newNextTask.moveAfter(taskToMove.getId());

        logger.debug(id + " Successfully moved to " + targetId);
    }
}
