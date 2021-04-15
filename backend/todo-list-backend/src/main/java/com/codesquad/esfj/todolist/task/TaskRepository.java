package com.codesquad.esfj.todolist.task;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

@Component
public class TaskRepository {
    private Map<Long, Task> tasks = new ConcurrentHashMap<Long, Task>() {{
        Task task = new Task(1L, "title1", "content1", "writer1", "todo");
        Task task2 = new Task(2L, "title2", "content2", "writer2", "todo");
        Task task3 = new Task(3L, "title2", "content2", "writer2", "done");

        task.moveAfter(2L);
        task.setIsHead(true);
        task3.setIsHead(true);

        put(1L, task);
        put(2L, task2);
        put(3L, task3);
    }};

    public List<Task> findAllByNotDeleted() {
        return tasks.values().stream()
                .filter(task -> !task.isDeleted())
                .collect(Collectors.toList());
    }

    public List<Task> findAllByNotDeletedAndTaskType(String taskType) {
        return tasks.values().stream()
                .filter(task -> !task.isDeleted())
                .filter(task -> task.getTaskType().equals(taskType))
                .collect(Collectors.toList());
    }

    public Optional<Task> findOne(long id) {
        return Optional.ofNullable(tasks.get(id));
    }

    public Optional<Task> findOneByPreviousId(long previousId) {
        return tasks.values().stream()
                .filter(task -> task.getPreviousId().equals(previousId))
                .findAny();
    }

    public Optional<Task> findOneByPreviousIdAndTaskType(long previousId, String taskType) {
        return tasks.values().stream()
                .filter(task -> task.getPreviousId().equals(previousId) && task.getTaskType().equals(taskType))
                .findAny();
    }

    public Task save(Task newTask) {
        if (newTask.getId() == null) {
            newTask.setId(tasks.size() + 1L);
        }
        tasks.put(newTask.getId(), newTask);
        return newTask;
    }
}
