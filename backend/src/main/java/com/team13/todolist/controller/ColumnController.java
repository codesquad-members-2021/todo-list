package com.team13.todolist.controller;

import com.team13.todolist.service.ColumnService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/columns")
public class ColumnController {

    private final ColumnService columnService;

    public ColumnController(ColumnService columnService) {
        this.columnService = columnService;
    }

    @GetMapping
    public ResponseEntity<?> columns() {
        return ResponseEntity.ok(responseBody("columns", columnService.getColumns()));
    }

    @GetMapping("/{columnId}")
    public ResponseEntity<?> column(@PathVariable("columnId") Long columnId) {
        return ResponseEntity.ok(responseBody("column", columnService.getColumn(columnId)));
    }

    private Map<String, Object> responseBody(String rootName, Object body) {
        Map<String, Object> responseBody = new HashMap<>();
        responseBody.put(rootName, body);
        return responseBody;
    }

}
