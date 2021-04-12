package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.Column;
import com.codesquad.todo.web.domain.Task;
import com.codesquad.todo.web.domain.User;
import com.codesquad.todo.web.service.dto.ColumnDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/columns")
public class ColumnController {

/*
    @GetMapping
    public ResponseEntity<Map<String, Object>> showColumnList() {
        Map<String, Object> responseMap = new HashMap<>();

        List<ColumnDto> columns = new ArrayList<>();
        User author = new User("라쿠운", "Racoon", "1234", "");

        Column todoColumn = new Column("TODO");
        todoColumn.addTask(new Task("task1", "taskContent1"));
        todoColumn.addTask(new Task("task2", "taskContent2"));
        columns.add(new ColumnDto(todoColumn));

        Column inProgressColumn = new Column("IN_PROGRESS");
        inProgressColumn.addTask(new Task("task3", "taskContent3"));
        columns.add(new ColumnDto(inProgressColumn));


        responseMap.put("columns", columns);
        return ResponseEntity.ok(responseMap);
    }
*/

}
