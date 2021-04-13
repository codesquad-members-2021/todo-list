package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.Column;
import com.codesquad.todo.web.domain.Task;
import com.codesquad.todo.web.domain.User;
import com.codesquad.todo.web.domain.UserRepository;
import com.codesquad.todo.web.service.dto.ColumnDto;
import com.codesquad.todo.web.service.dto.TaskDto;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ColumnService {
    private final UserRepository userRepository;

    public ColumnService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<ColumnDto> showColumnList(User user) {
        List<Column> columnList = user.getColumnList();
        List<ColumnDto> columnDtoList = new ArrayList<>();

        for (Column column : columnList) {
            ColumnDto columnDto = new ColumnDto(column);
            for (Task task : column.getTaskList()) {
                columnDto.addTaskDto(new TaskDto(task, user.getName()));
            }
            columnDtoList.add(columnDto);
        }
        return columnDtoList;
    }
}
