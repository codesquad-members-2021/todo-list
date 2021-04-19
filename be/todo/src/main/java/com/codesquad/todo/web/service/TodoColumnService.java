package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.TodoColumn;
import com.codesquad.todo.web.domain.TodoTask;
import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.service.dto.TodoColumnDto;
import com.codesquad.todo.web.service.dto.ShowColumnListDto;
import com.codesquad.todo.web.service.dto.TodoTaskDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodoColumnService {

    public ShowColumnListDto showColumnList(TodoUser todoUser) {
        List<TodoColumn> todoColumnList = todoUser.getColumnList();
        ShowColumnListDto showColumnListDto = new ShowColumnListDto();

        for (TodoColumn todoColumn : todoColumnList) {
            TodoColumnDto todoColumnDto = new TodoColumnDto(todoColumn);
            for (TodoTask todoTask : todoColumn.getTaskList()) {
                todoColumnDto.addTaskDto(new TodoTaskDto(todoTask, todoUser.getName()));
            }
            showColumnListDto.addColumnDto(todoColumnDto);
        }
        return showColumnListDto;
    }
}
