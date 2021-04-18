package com.codesquad.todoList.controller;

import com.codesquad.todoList.entity.Card;
import com.codesquad.todoList.entity.Columns;
import com.codesquad.todoList.error.ErrorCode;
import com.codesquad.todoList.error.ErrorResponse;
import com.codesquad.todoList.service.ColumnService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/columns")
@RequiredArgsConstructor
public class ApiColumnController {

    private static final Logger log = LoggerFactory.getLogger(ApiColumnController.class);

    private final ColumnService columnService;

    @PostMapping
    public ResponseEntity<?> addColumn(@Validated @RequestBody Columns columns, BindingResult bindingResult) {
        columnService.addColumn(columns);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getColumns(@PathVariable Long id) {
        final List<Card> columns = columnService.getColumn(id);
        return ResponseEntity.ok().body(columns);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateColumns(@PathVariable Long id, @Validated @RequestBody Columns columns,  BindingResult bindingResult) {
        columnService.updateColumn(id, columns);
        return ResponseEntity.ok().build();
    }

}
