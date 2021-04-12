package com.team08.todolist.controller;

import com.team08.todolist.model.Column;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/columns")
public class ApiColumnController {

    @GetMapping
    public List<Column> list() {
        List<Column> columns = new ArrayList<>();
        columns.add(new Column(1L, "ToDo", 65535, 1));
        columns.add(new Column(2L, "Doing", 65535 * 2, 1));
        columns.add(new Column(3L, "Done", 65535 * 4, 1));
        return columns;
    }
}
