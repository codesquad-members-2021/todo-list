package com.codesquad.esfj.todolist.task;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class TaskService {

    private TaskRepository taskRepository;

    public TaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public Map<String, List<TaskDTO.Response>> readAll() {
        return TaskDTO.groupingByType(taskRepository.findAllByNotDeleted());
    }

    public Map<String, List<TaskDTO.Response>> readAllBy(String taskType) {
        List<Task> tasks = taskRepository.findAllByNotDeletedAndTaskType(taskType);
        return TaskDTO.groupingByType(tasks);
    }

    public TaskDTO.Response readOne(long id) {
        return TaskDTO.response(taskRepository.findOne(id));
    }

    public long create(Task task) {
        Optional<Task> topTask = taskRepository.findOneByPreviousIdAndTaskType(Task.TOP_PREVIOUS_ID, task.getTaskType());
        long id = taskRepository.save(task).getId();

        if (topTask.isPresent()) {
            topTask.get().moveAfter(id);
            taskRepository.save(topTask.get());
        }

        return id;
    }

    public void update(long id, Task updatedTask) {
        Task task = taskRepository.findOne(id).update(updatedTask);
        taskRepository.save(task);
    }

    public void delete(long id) {
        Task task = taskRepository.findOne(id);
        Optional<Task> nextTask = taskRepository.findOneByPreviousId(id);
        if (nextTask.isPresent()) {
            Task presentNextTask = nextTask.get();
            presentNextTask.moveAfter(task.getPreviousId());
            taskRepository.save(presentNextTask);
        }

        taskRepository.save(task.delete());
    }

    public void move(long id, String targetTaskType, long targetId) {
        Task taskToMove = taskRepository.findOne(id);
        Optional<Task> originalNextTask = taskRepository.findOneByPreviousId(id);
        Optional<Task> newNextTask = taskRepository.findOneByPreviousId(targetId);

        if (originalNextTask.isPresent()) {
            originalNextTask.get().moveAfterPreviousOf(taskToMove);
            taskRepository.save(originalNextTask.get());
        }

        if (newNextTask.isPresent()) {
            taskToMove.moveAfterPreviousOf(newNextTask.get());
            taskRepository.save(taskToMove);

            newNextTask.get().moveAfter(taskToMove.getId());
            taskRepository.save(newNextTask.get());
        } else {
            taskToMove.moveAfter(targetId, targetTaskType);
            taskRepository.save(taskToMove);
        }
    }
}
