package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.TodoColumn;
import com.codesquad.todo.web.domain.TodoTask;
import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.service.dto.ColumnDto;
import com.codesquad.todo.web.service.dto.ShowColumnListDto;
import com.codesquad.todo.web.service.dto.TaskDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodoColumnService {

    public ShowColumnListDto showColumnList(TodoUser todoUser) {
        List<TodoColumn> todoColumnList = todoUser.getColumnList();
        ShowColumnListDto showColumnListDto = new ShowColumnListDto();

        for (TodoColumn todoColumn : todoColumnList) {
            ColumnDto columnDto = new ColumnDto(todoColumn);
            for (TodoTask todoTask : todoColumn.getTaskList()) {
                columnDto.addTaskDto(new TaskDto(todoTask, todoUser.getName()));
            }
            showColumnListDto.addColumnDto(columnDto);
        }
        return showColumnListDto;
    }
}
