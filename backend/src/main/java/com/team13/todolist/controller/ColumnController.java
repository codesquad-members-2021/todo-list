package com.team13.todolist.controller;

import com.team13.todolist.model.Column;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/columns")
public class ColumnController {

    @GetMapping
    public ResponseEntity<Map<String, List<Column>>> columns() {
        Map<String, List<Column>> columnsResponseBody = new HashMap<>();
        columnsResponseBody.put("columns",
                Arrays.asList(
                        new Column(1L, "해야할 일"),
                        new Column(2L, "하고 있는 일"),
                        new Column(3L, "완료한 일")
                ));
        return ResponseEntity.ok(columnsResponseBody);
    }

}
