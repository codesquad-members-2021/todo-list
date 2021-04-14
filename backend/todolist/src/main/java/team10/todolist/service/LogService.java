package team10.todolist.service;

import org.springframework.stereotype.Service;
import team10.todolist.domain.Log;
import team10.todolist.repository.LogRepository;

import java.util.List;

@Service
public class LogService {

    private final LogRepository logRepository;

    public LogService(LogRepository logRepository) {
        this.logRepository = logRepository;
    }


    public List<Log> readAll() {
        return logRepository.findAll();
    }
}
