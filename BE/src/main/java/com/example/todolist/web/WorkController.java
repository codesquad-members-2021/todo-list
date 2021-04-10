package com.example.todolist.web;

import com.example.todolist.service.WorkService;
import com.example.todolist.web.dto.RequestCreateWorkDto;
import com.example.todolist.web.dto.RequestUpdateWorkDto;
import com.example.todolist.web.dto.ResponseWorkDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/works")
    public ResponseWorkDto createWork(@RequestBody RequestCreateWorkDto workDto, HttpSession session) {
        logger.info("work 생성 요청");
        return workService.save(workDto, getUserFromSession(session));
    }

    @PutMapping("/works/{id}")
    public ResponseWorkDto updateWork(@PathVariable Long id, @RequestBody RequestUpdateWorkDto workDto, HttpSession session) {
        logger.info("work 수정 요청");
        return workService.update(id, workDto, getUserFromSession(session));
    }

    @DeleteMapping("/works/{id}")
    public void deleteWork(@PathVariable Long id, HttpSession session) {
        logger.info("work 삭제 요청");
        workService.delete(id, getUserFromSession(session));
    }

    @PostMapping("/works/{id}")
    public ResponseWorkDto moveWork(@PathVariable Long id, @RequestBody int status, HttpSession session) {
        logger.info("work 이동 요청");
        return workService.move(id, status, getUserFromSession(session));
    }

}
