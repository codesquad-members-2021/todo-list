package team10.todolist.service;

import team10.todolist.repository.LogRepository;

public class LogService {

    private final LogRepository logRepository;

    public LogService(LogRepository logRepository) {
        this.logRepository = logRepository;
    }


}
