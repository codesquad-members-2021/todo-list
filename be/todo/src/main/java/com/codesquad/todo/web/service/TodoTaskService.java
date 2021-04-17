package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.*;
import com.codesquad.todo.web.service.dto.CreateTodoTaskDto;
import com.codesquad.todo.web.service.dto.TodoTaskDto;
import com.codesquad.todo.web.service.dto.TodoTaskParameterDto;
import org.springframework.stereotype.Service;

@Service
public class TodoTaskService {
    private final TodoUserRepository todoUserRepository;

    public TodoTaskService(TodoUserRepository todoUserRepository) {
        this.todoUserRepository = todoUserRepository;
    }

    public CreateTodoTaskDto createTask(TodoUser todoUser, Long columnId, TodoTaskParameterDto todoTaskParameterDto) {
        TodoColumn todoColumn = todoUser.findColumnById(columnId);
        todoColumn.addTask(todoTaskParameterDto);

        TodoLog todoLog = TodoLog.buildCreateTodoLog(todoColumn.getColumnTitle(), todoTaskParameterDto.getTaskTitle());
        todoUser.addTodoLog(todoLog);

        todoUser = todoUserRepository.save(todoUser);
        todoColumn = todoUser.findColumnById(columnId);
        TodoTask todoTask = todoColumn.firstTask();
        return new CreateTodoTaskDto(new TodoTaskDto(todoTask, todoUser.getName()));
    }

    public void removeTask(TodoUser todoUser, Long columnId, Long taskId) {
        TodoColumn todoColumn = todoUser.findColumnById(columnId);
        TodoTask removedTodoTask = todoColumn.popTask(taskId);
        TodoLog todoLog = TodoLog.buildRemoveTodoLog(todoColumn.getColumnTitle(), removedTodoTask.getTaskTitle());
        todoUser.addTodoLog(todoLog);
        todoUserRepository.save(todoUser);
    }

    public void updateTask(TodoUser todoUser, Long columnId, Long taskId, TodoTaskParameterDto todoTaskParameterDto) {
        TodoColumn todoColumn = todoUser.findColumnById(columnId);
        TodoTask foundTodoTask = todoColumn.findTaskById(taskId);
        foundTodoTask.update(todoTaskParameterDto);
        TodoLog todoLog = TodoLog.buildUpdateTodoLog(todoColumn.getColumnTitle(), foundTodoTask.getTaskTitle());
        todoUser.addTodoLog(todoLog);
        todoUserRepository.save(todoUser);
    }

    public void moveTask(TodoUser todoUser, Long columnId, Long nextColumnId, Long taskId, int newTaskPosition) {
        todoUser.moveTask(columnId, nextColumnId, taskId, newTaskPosition);
        todoUserRepository.save(todoUser);
    }
}
