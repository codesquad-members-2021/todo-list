package team_16.todolist.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team_16.todolist.domain.Log;
import team_16.todolist.repository.LogRepository;

@RestController
@RequestMapping("/logs")
public class LogController {
    private final LogRepository logRepository;

    public LogController(LogRepository logRepository) {
        this.logRepository = logRepository;
    }

    @GetMapping
    public Log getLogs() {
        return (Log)logRepository.findAll();
    }

}
