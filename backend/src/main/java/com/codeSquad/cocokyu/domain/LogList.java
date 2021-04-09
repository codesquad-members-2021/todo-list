package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.model.Log;

import java.util.List;

public class LogList {

    private List<Log> logs;

    public LogList(List<Log> logs) {
        this.logs = logs;
    }

    public List<Log> getLogs() {
        return logs;
    }
}
