package team10.todolist.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team10.todolist.domain.Log;
import team10.todolist.service.LogService;

import java.util.List;

@RestController
@RequestMapping("/log")
public class LogController {

    private final LogService logService;

    public LogController(LogService logService) {
        this.logService = logService;
    }

    @GetMapping("/lists")
    public List<Log> readAll() {
        return logService.readAll();
    }
}
