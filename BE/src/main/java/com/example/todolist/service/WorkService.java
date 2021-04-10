package com.example.todolist.service;

import com.example.todolist.domain.timeline.TimelineRepository;
import com.example.todolist.domain.user.User;
import com.example.todolist.domain.work.Work;
import com.example.todolist.domain.work.WorkRepository;
import com.example.todolist.web.dto.ResponseWorkDto;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class WorkService {

    private final WorkRepository workRepository;
    private final TimelineRepository timelineRepository;

    public WorkService(WorkRepository workRepository, TimelineRepository timelineRepository) {
        this.workRepository = workRepository;
        this.timelineRepository = timelineRepository;
    }

    public List<ResponseWorkDto> getWorks(User sessionUser) {
        return workRepository.findAllByAuthor(sessionUser.getId()).stream()
                .map(work -> new ResponseWorkDto(work, sessionUser))
                .collect(Collectors.toList());
    }

}
