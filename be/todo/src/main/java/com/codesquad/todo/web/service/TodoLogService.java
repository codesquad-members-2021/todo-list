package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.TodoLog;
import com.codesquad.todo.web.domain.TodoLogRepository;
import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.service.dto.ShowTodoLogListDto;
import com.codesquad.todo.web.service.dto.TodoLogDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodoLogService {
    private final TodoLogRepository todoLogRepository;

    public TodoLogService(TodoLogRepository todoLogRepository) {
        this.todoLogRepository = todoLogRepository;
    }

    public ShowTodoLogListDto showTodoLogList(TodoUser todoUser) {
        List<TodoLog> todoLogList = todoLogRepository.findFiveTodoLogByUser(todoUser.getId());
        ShowTodoLogListDto showTodoLogListDto = new ShowTodoLogListDto();
        for (TodoLog todoLog : todoLogList) {
            showTodoLogListDto.addTodoLogDto(new TodoLogDto(todoLog, todoUser.getName()));
        }
        return showTodoLogListDto;
    }
}
