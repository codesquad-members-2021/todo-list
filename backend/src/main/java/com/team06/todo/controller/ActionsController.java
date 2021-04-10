package com.team06.todo.controller;

import com.team06.todo.dto.ActionsResponseDto;
import com.team06.todo.service.ActionsService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/api/actions")
@RestController
public class ActionsController {

    private final ActionsService actionsService;

    public ActionsController(ActionsService actionsService) {
        this.actionsService = actionsService;
    }

    @GetMapping("/")
    public ResponseEntity<Map<String, List<ActionsResponseDto>>> show() {
        Map<String, List<ActionsResponseDto>> actionsResponseDto = new HashMap<>();
        actionsResponseDto.put("actions", actionsService.show());
        return ResponseEntity.ok(actionsResponseDto);
    }
}
