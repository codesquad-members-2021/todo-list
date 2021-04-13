package com.example.todolist.web;

import com.example.todolist.domain.user.User;
import com.example.todolist.domain.work.Work;
import com.example.todolist.domain.work.WorkRepository;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RestController
public class WorkController {

    public final WorkRepository workRepository;

    public WorkController(WorkRepository workRepository) {
        this.workRepository = workRepository;
    }

    @GetMapping("/works")
    public List<Work> showWorks(HttpSession session) {
        User user = (User) session.getAttribute("sessionUser");
        if (user == null || user.getId() != 1) {
            return new ArrayList<>();
        }
        return workRepository.findAllByAuthor(1L);
    }

}
