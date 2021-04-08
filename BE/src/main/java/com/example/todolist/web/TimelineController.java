package com.example.todolist.web;

import com.example.todolist.domain.timeline.Timeline;
import com.example.todolist.domain.timeline.TimelineRepository;
import com.example.todolist.domain.user.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RestController
public class TimelineController {

    public final TimelineRepository timelineRepository;

    public TimelineController(TimelineRepository timelineRepository) {
        this.timelineRepository = timelineRepository;
    }

    @GetMapping("/timelines")
    public List<Timeline> showTimeline(HttpSession session) {
        User user = (User) session.getAttribute("sessionUser");
        if (user == null || user.getId() != 1) {
            return new ArrayList<>();
        }
        return timelineRepository.findAllByAuthor(1L);
    }

}
