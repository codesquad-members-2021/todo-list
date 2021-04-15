package team_16.todolist.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team_16.todolist.domain.Log;
import team_16.todolist.service.LogService;

import java.util.Set;

@RestController
@RequestMapping("/logs")
public class LogController {

    private final LogService logService;

    public LogController(LogService logService) {
        this.logService = logService;
    }

    @GetMapping
    public Set<Log> getLog() {
        return logService.findAll();
    }
}
