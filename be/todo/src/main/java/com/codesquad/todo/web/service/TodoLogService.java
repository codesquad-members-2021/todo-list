package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.TodoLog;
import com.codesquad.todo.web.domain.TodoLogRepository;
import com.codesquad.todo.web.domain.User;
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

    public List<TodoLogDto> showTodoLogList(User user) {
        List<TodoLog> todoLogList = todoLogRepository.findFiveTodoLogByUser(user.getId());
        List<TodoLogDto> todoLogDtoList = new ArrayList<>();
        for (TodoLog todoLog : todoLogList) {
            todoLogDtoList.add(new TodoLogDto(todoLog, user.getName()));
        }
        return todoLogDtoList;
    }
}
