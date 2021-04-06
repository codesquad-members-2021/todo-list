package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.Column;
import com.codesquad.todo.web.domain.Task;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/columns")
public class ColumnController {

    @GetMapping
    public List<Column> showColumnList() {
        return null;
    }
}
