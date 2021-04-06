package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.Column;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/columns")
public class ColumnController {

    @GetMapping
    public List<Column> showColumnList() {
        return null;
    }
}
