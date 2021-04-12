package com.codesquad.todo.web.domain;

import com.codesquad.todo.web.exceptions.TaskNotFoundException;
import com.codesquad.todo.web.service.dto.TaskDto;
import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Column {
    @Id
    private Long id;
    private String columnTitle;
    private List<Task> taskList = new ArrayList<>();

    public Column(String columnTitle) {
        this.columnTitle = columnTitle;
    }

    protected Column() {
    }

    public int sizeOfTaskList() {
        return taskList.size();
    }

    public Task findTaskById(Long taskId) {
        return taskList.stream()
                .filter(task -> task.isSameId(taskId))
                .findFirst()
                .orElseThrow(TaskNotFoundException::new);
    }

    public Task lastTask() {
        Task task = taskList.get(taskList.size() - 1);
        if (task == null) {
            throw new TaskNotFoundException();
        }
        return task;
    }

    public void addTaskAt(int index, Task task) {
        taskList.add(index, task);
    }

    public void addTask(Task task) {
        taskList.add(task);
    }

    public void addTask(String taskTitle, String taskContent) {
        addTask(new Task(taskTitle, taskContent));
    }

    public Task popTask(Long id) {
        for (int i = 0; i < taskList.size(); i++) {
            Task task = taskList.get(i);
            if (task.isSameId(id)) {
                taskList.remove(i);
                return task;
            }
        }
        throw new TaskNotFoundException();
    }

    public void removeTaskById(Long id) {
        Task task = findTaskById(id);
        taskList.remove(task);
    }

    public List<TaskDto> convertTaskListToTaskDtoList() {
        return taskList.stream().map(task -> new TaskDto(task, "test")).collect(Collectors.toList());
    }

    public boolean isSameTitle(Column column) {
        return this.columnTitle.equals(column.columnTitle);
    }

    public boolean isSameId(Long columnId) {
        return id.equals(columnId);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getColumnTitle() {
        return columnTitle;
    }

    public void setColumnTitle(String columnTitle) {
        this.columnTitle = columnTitle;
    }

    public List<Task> getTaskList() {
        return taskList;
    }

    public void setTaskList(List<Task> taskList) {
        this.taskList = taskList;
    }

    @Override
    public String toString() {
        return "Column{" +
                "id=" + id +
                ", columnTitle='" + columnTitle + '\'' + '\n' +
                ", taskList= \n" + taskList +
                '}' + '\n';
    }
}
