package com.codesquad.esfj.todolist.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
public class TaskController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private TaskService taskService;

    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping("/tasks")
    public Map<String, List<TaskDTO.Response>> readAll(@RequestParam Optional<String> taskType) {
        if (taskType.isPresent()) {
            return taskService.readAllBy(taskType.get());
        }

        return taskService.readAll();
    }

    @GetMapping("/tasks/{id}")
    public Task readOne(@PathVariable long id) {
        return taskService.readOne(id);
    }

    @PostMapping("/tasks")
    @ResponseStatus(HttpStatus.CREATED)
    public long create(@RequestBody Task task) {
        return taskService.create(task);
    }

    @PutMapping("/tasks/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void update(@PathVariable long id, @RequestBody Task updatedTask) {
        taskService.update(id, updatedTask);
    }

    @DeleteMapping("/tasks/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable long id) {
        taskService.delete(id);
    }

    @PatchMapping("/tasks/{id}/{targetTaskType}/{targetId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void move(@PathVariable long id, @PathVariable String targetTaskType, @PathVariable long targetId) {
        taskService.move(id, targetTaskType, targetId);
    }
}
