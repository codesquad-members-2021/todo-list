package com.codesquad.esfj.todolist.task;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class TaskService {

    private JdbcTaskRepository taskRepository;

    public TaskService(JdbcTaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public Map<String, List<TaskDTO.Response>> readAll() {
        return TaskDTO.groupingByType(taskRepository.findAllByDeletedFalse());
    }

    public Map<String, List<TaskDTO.Response>> readAllBy(String taskType) {
        List<Task> tasks = taskRepository.findAllByTaskTypeAndDeletedFalse(taskType);
        return TaskDTO.groupingByType(tasks);
    }

    public TaskDTO.Response readOne(long id) {
        return TaskDTO.response(taskRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당하는 Task가 존재하지 않습니다." + id)));
    }

    public long create(Task task) {
        Optional<Task> topTask = taskRepository.findByPreviousIdAndTaskType(Task.TOP_PREVIOUS_ID, task.getTaskType());
        long id = taskRepository.save(task).getId();

        if (topTask.isPresent()) {
            topTask.get().moveAfter(id);
            taskRepository.save(topTask.get());
        }

        return id;
    }

    public void update(long id, Task updatedTask) {
        Task task = taskRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당하는 Task가 존재하지 않습니다." + id))
                .update(updatedTask);
        taskRepository.save(task);
    }

    public void delete(long id) {
        Task task = taskRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당하는 Task가 존재하지 않습니다." + id));
        Optional<Task> nextTask = taskRepository.findByPreviousId(id);
        if (nextTask.isPresent()) {
            Task presentNextTask = nextTask.get();
            presentNextTask.moveAfter(task.getPreviousId());
            taskRepository.save(presentNextTask);
        }

        taskRepository.save(task.delete());
    }

    public void move(long id, String targetTaskType, long targetId) {
        Task taskToMove = taskRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당하는 Task가 존재하지 않습니다." + id));;
        Optional<Task> originalNextTask = taskRepository.findByPreviousId(id);
        Optional<Task> newNextTask = taskRepository.findByPreviousId(targetId);

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
