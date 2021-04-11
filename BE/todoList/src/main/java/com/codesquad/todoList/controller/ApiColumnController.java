package com.codesquad.todoList.controller;

import com.codesquad.todoList.entity.Card;
import com.codesquad.todoList.entity.Columns;
import com.codesquad.todoList.error.ErrorCode;
import com.codesquad.todoList.error.ErrorResponse;
import com.codesquad.todoList.service.ColumnService;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/columns")
@AllArgsConstructor
public class ApiColumnController {

    private static final Logger log = LoggerFactory.getLogger(ApiColumnController.class);

    private final ColumnService columnService;

    @PostMapping
    public ResponseEntity<?> addColumn(@Validated @RequestBody Columns columns, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            ErrorResponse errorResponse = ErrorResponse.of(ErrorCode.BAD_REQUEST, bindingResult);
            log.error("ADD COLUMN ERROR : {}", errorResponse);
            return ResponseEntity.badRequest().body(errorResponse);
        }
        columnService.addColumn(columns);
        return ResponseEntity.ok().body(columns);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getColumns(@PathVariable Long id) {
        final List<Card> columns = columnService.getColumn(id);
        return ResponseEntity.ok().body(columns);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateColumns(@PathVariable Long id, @Validated @RequestBody Columns columns,  BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            ErrorResponse errorResponse = ErrorResponse.of(ErrorCode.BAD_REQUEST, bindingResult);
            log.error("UPDATE COLUMN ERROR : {}", errorResponse);
            return ResponseEntity.badRequest().body(errorResponse);
        }
        columnService.updateColumn(id, columns);
        return ResponseEntity.ok().build();
    }

}
