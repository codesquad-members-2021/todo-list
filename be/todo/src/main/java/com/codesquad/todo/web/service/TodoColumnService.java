package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.TodoColumn;
import com.codesquad.todo.web.domain.TodoTask;
import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.domain.UserRepository;
import com.codesquad.todo.web.service.dto.ColumnDto;
import com.codesquad.todo.web.service.dto.TaskDto;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TodoColumnService {
    private final UserRepository userRepository;

    public TodoColumnService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<ColumnDto> showColumnList(TodoUser todoUser) {
        List<TodoColumn> todoColumnList = todoUser.getColumnList();
        List<ColumnDto> columnDtoList = new ArrayList<>();

        for (TodoColumn todoColumn : todoColumnList) {
            ColumnDto columnDto = new ColumnDto(todoColumn);
            for (TodoTask todoTask : todoColumn.getTaskList()) {
                columnDto.addTaskDto(new TaskDto(todoTask, todoUser.getName()));
            }
            columnDtoList.add(columnDto);
        }
        return columnDtoList;
    }
}
