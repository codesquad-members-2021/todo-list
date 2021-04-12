package com.example.todolist.service;

import com.example.todolist.domain.timeline.TimelineRepository;
import com.example.todolist.domain.user.User;
import com.example.todolist.web.dto.ResponseTimelineDto;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class TimelineService {

    private final TimelineRepository timelineRepository;

    public TimelineService(TimelineRepository timelineRepository) {
        this.timelineRepository = timelineRepository;
    }

    public List<ResponseTimelineDto> getTimelines(User sessionUser) {
        return timelineRepository.findAllByAuthorId(sessionUser.getId()).stream()
                .map(timeline -> new ResponseTimelineDto(timeline, sessionUser))
                .collect(Collectors.toList());
    }

}
