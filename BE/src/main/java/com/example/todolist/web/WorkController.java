package com.example.todolist.web;

import com.example.todolist.service.WorkService;
import com.example.todolist.web.dto.CreateWorkRequestDTO;
import com.example.todolist.web.dto.MoveWorkRequestDTO;
import com.example.todolist.web.dto.UpdateWorkRequestDTO;
import com.example.todolist.web.dto.WorkResponseDTO;
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
    public List<WorkResponseDTO> showWorks(HttpSession session) {
        logger.info("work 리스트 요청");
        return workService.getWorks(getUserFromSession(session));
    }

    @PostMapping("/works")
    public WorkResponseDTO createWork(@RequestBody CreateWorkRequestDTO workDto, HttpSession session) {
        logger.info("work 생성 요청");
        return workService.save(workDto, getUserFromSession(session));
    }

    @PutMapping("/works/{id}")
    public WorkResponseDTO updateWork(@PathVariable Long id, @RequestBody UpdateWorkRequestDTO workDto, HttpSession session) {
        logger.info("work 수정 요청");
        return workService.update(id, workDto, getUserFromSession(session));
    }

    @DeleteMapping("/works/{id}")
    public void deleteWork(@PathVariable Long id, HttpSession session) {
        logger.info("work 삭제 요청");
        workService.delete(id, getUserFromSession(session));
    }

    @PostMapping("/works/{id}")
    public WorkResponseDTO moveWork(@PathVariable Long id, @RequestBody MoveWorkRequestDTO workDto, HttpSession session) {
        logger.info("work 이동 요청");
        return workService.move(id, workDto, getUserFromSession(session));
    }

}
