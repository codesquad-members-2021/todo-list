package team_16.todolist.service;

import org.springframework.stereotype.Service;
import team_16.todolist.repository.LogRepository;

@Service
public class LogService {
    private final LogRepository logRepository;

    public LogService(LogRepository logRepository) {
        this.logRepository = logRepository;
    }
}
