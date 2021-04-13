package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.TodoLog;
import com.codesquad.todo.web.domain.TodoLogRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodoLogService {
    private final TodoLogRepository todoLogRepository;

    public TodoLogService(TodoLogRepository todoLogRepository) {
        this.todoLogRepository = todoLogRepository;
    }

    public List<TodoLog> showTodoLogList() {
        return todoLogRepository.findFiveTodoLogByUser(1L);
    }
}
