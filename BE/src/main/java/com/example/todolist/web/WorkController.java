package com.example.todolist.web;

import com.example.todolist.domain.work.Work;
import com.example.todolist.domain.work.WorkRepository;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class WorkController {

    public final WorkRepository workRepository;

    public WorkController(WorkRepository workRepository) {

        this.workRepository = workRepository;
    }

    @GetMapping("/works")
    public List<Work> showWorks() {
        System.out.println(workRepository.findAll());

        return workRepository.findAll();
    }
}
