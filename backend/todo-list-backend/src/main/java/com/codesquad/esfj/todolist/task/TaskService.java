package com.codesquad.esfj.todolist.task;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class TaskService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private JdbcTaskRepository taskRepository;

    public TaskService(JdbcTaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public Map<String, List<TaskDTO.Response>> readAll() {
        Map<Long, Task> result = taskRepository.findAllByDeletedFalse().stream()
                .collect(Collectors.toMap(Task::getId, task -> task));

        return TaskDTO.groupingByType(result);
    }

    public Map<String, List<TaskDTO.Response>> readAllBy(String taskType) {
        List<Task> tasks = taskRepository.findAllByTaskTypeAndDeletedFalse(taskType);
        return TaskDTO.groupingByType(tasks.stream()
                .collect(Collectors.toMap(Task::getId, task -> task)));
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
        } else {
            setIsHeadIfPresent(task.getId(), true);
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
        } else {
            setIsHeadIfPresent(task.getPreviousId(), true);
        }

        taskRepository.save(task.delete());
    }

    public void move(long id, String targetTaskType, long targetId) {
        Task taskToMove = taskRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당하는 Task가 존재하지 않습니다." + id));

        Optional<Task> originalNextTask = taskRepository.findByPreviousId(id);
        Optional<Task> newNextTask = taskRepository.findByPreviousIdAndTaskType(targetId, targetTaskType);

        if (originalNextTask.isPresent()) {
            originalNextTask.get().moveAfterPreviousOf(taskToMove);
            taskRepository.save(originalNextTask.get());
        } else {
            setIsHeadIfPresent(taskToMove.getPreviousId(), true);
        }

        if (newNextTask.isPresent()) {
            taskToMove.moveAfterPreviousOf(newNextTask.get());
            taskRepository.save(taskToMove);

            setIsHeadIfPresent(taskToMove.getPreviousId(), false);

            newNextTask.get().moveAfter(taskToMove.getId());

            taskRepository.save(newNextTask.get());
        } else {
            taskToMove.moveAfter(targetId, targetTaskType);
            taskToMove.setIsHead(true);
            setIsHeadIfPresent(taskToMove.getPreviousId(), false);
            taskRepository.save(taskToMove);
        }
    }

    private void setIsHeadIfPresent(long targetId, boolean isHead) {
        Optional<Task> task = taskRepository.findById(targetId);

        if (task.isPresent()) {
            Task presentTask = task.get();
            presentTask.setIsHead(isHead);
            taskRepository.save(presentTask);
        }
    }
}
