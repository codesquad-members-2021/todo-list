package com.team06.todo.controller;

import com.team06.todo.dto.ActionsResponse;
import com.team06.todo.service.ActionsService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/api/actions")
@RestController
public class ActionsController {

    private final ActionsService actionsService;

    public ActionsController(ActionsService actionsService) {
        this.actionsService = actionsService;
    }

    @GetMapping("/show")
    public ResponseEntity<ActionsResponse> show() {
        return ResponseEntity.ok(actionsService.show());
    }
}
