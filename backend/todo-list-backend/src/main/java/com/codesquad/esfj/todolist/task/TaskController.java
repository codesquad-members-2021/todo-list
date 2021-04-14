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

    private TaskRepository taskRepository;

    public TaskController(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    @GetMapping("/tasks")
    public Map<String, List<TaskDTO.Response>> readAll(@RequestParam Optional<String> taskType) {
        if (taskType.isPresent()) {
            List<Task> tasks = taskRepository.findAllByNotDeletedAndTaskType(taskType.get());
            return TaskDTO.groupingByType(tasks);
        }

        return TaskDTO.groupingByType(taskRepository.findAllByNotDeleted());
    }

    @GetMapping("/tasks/{id}")
    public Task readOne(@PathVariable Long id) {
        return taskRepository.findOne(id);
    }

    @PostMapping("/tasks")
    @ResponseStatus(HttpStatus.CREATED)
    public Long create(@RequestBody Task task) {
        Optional<Task> topTask = taskRepository.findOneByPreviousIdAndTaskType(Task.TOP_PREVIOUS_ID, task.getTaskType());
        long id = taskRepository.save(task).getId();

        if (topTask.isPresent()) {
            topTask.get().moveAfter(id);
            taskRepository.save(topTask.get());
        }

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
        Task task = taskRepository.findOne(id);
        Optional<Task> nextTask = taskRepository.findOneByPreviousId(id);
        if (nextTask.isPresent()) {
            Task presentNextTask = nextTask.get();
            presentNextTask.moveAfter(task.getPreviousId());
            taskRepository.save(presentNextTask);
        }

        taskRepository.save(task.delete());
    }

    @PatchMapping("/tasks/{id}/{targetTaskType}/{targetId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void move(@PathVariable Long id, @PathVariable String targetTaskType, @PathVariable Long targetId) {
        Task taskToMove = taskRepository.findOne(id);
        Optional<Task> originalNextTask = taskRepository.findOneByPreviousId(id);
        Task newNextTask = readByPreviousId(targetId);

        if (originalNextTask.isPresent()) {
            originalNextTask.get().moveAfter(taskToMove);
            taskRepository.save(originalNextTask.get());
        }

        taskToMove.moveAfter(newNextTask);
        taskRepository.save(taskToMove);

        newNextTask.moveAfter(taskToMove);
        taskRepository.save(newNextTask);
    }

    private Task readByPreviousId(Long previousId) {
        return taskRepository.findOneByPreviousId(previousId).orElseThrow(IllegalArgumentException::new);
    }
}
