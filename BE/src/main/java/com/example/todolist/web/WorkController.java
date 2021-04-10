package com.example.todolist.web;

import com.example.todolist.domain.user.User;
import com.example.todolist.domain.work.Work;
import com.example.todolist.domain.work.WorkRepository;

import com.example.todolist.service.WorkService;
import com.example.todolist.web.dto.ResponseWorkDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

import static com.example.todolist.web.utils.HttpSessionUtils.getUserFromSession;

@RestController
public class WorkController {

    private final Logger logger = LoggerFactory.getLogger(WorkController.class);
    public final WorkService workService;

    public WorkController(WorkService workService) {
        this.workService = workService;
    }

    @GetMapping("/works")
    public List<ResponseWorkDto> showWorks(HttpSession session) {
        logger.info("work 리스트 요청");
        return workService.getWorks(getUserFromSession(session));
    }

}
