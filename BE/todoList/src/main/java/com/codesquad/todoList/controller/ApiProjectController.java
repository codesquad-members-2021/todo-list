package com.codesquad.todoList.controller;

import com.codesquad.todoList.repository.ProjectRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
public class ApiProjectController {

    private final ProjectRepository projectRepository;

    @GetMapping("")
    public ResponseEntity<?> getProjects() {
        return ResponseEntity.ok(projectRepository.findById(1L).orElseThrow(IllegalArgumentException::new));
    }

}
