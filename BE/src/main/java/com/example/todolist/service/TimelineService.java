package com.example.todolist.service;

import com.example.todolist.domain.timeline.TimelineRepository;
import com.example.todolist.domain.user.User;
import com.example.todolist.web.dto.TimelineResponseDTO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import static com.example.todolist.web.dto.TimelineResponseDTO.buildTimelineResponseDTO;

@Service
public class TimelineService {

    private final TimelineRepository timelineRepository;

    public TimelineService(TimelineRepository timelineRepository) {
        this.timelineRepository = timelineRepository;
    }

    public List<TimelineResponseDTO> getTimelines(User sessionUser) {
        return timelineRepository.findAllByAuthorId(sessionUser.getId()).stream()
                .map(timeline -> buildTimelineResponseDTO(timeline, sessionUser))
                .collect(Collectors.toList());
    }

}
