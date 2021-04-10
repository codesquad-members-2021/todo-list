package com.codesquad.todo.web.controller;

import com.codesquad.todo.web.domain.Task;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/tasks")
public class TaskController {

    @GetMapping()
    public List<Task> showTaskList() {
        return null;
    }

}
