package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.TodoLog;
import com.codesquad.todo.web.domain.TodoLogRepository;
import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.service.dto.TodoLogDto;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TodoLogService {
    private final TodoLogRepository todoLogRepository;

    public TodoLogService(TodoLogRepository todoLogRepository) {
        this.todoLogRepository = todoLogRepository;
    }

    public List<TodoLogDto> showTodoLogList(TodoUser todoUser) {
        List<TodoLog> todoLogList = todoLogRepository.findFiveTodoLogByUser(todoUser.getId());
        List<TodoLogDto> todoLogDtoList = new ArrayList<>();
        for (TodoLog todoLog : todoLogList) {
            todoLogDtoList.add(new TodoLogDto(todoLog, todoUser.getName()));
        }
        return todoLogDtoList;
    }
}
