package com.example.todolist.web;

import com.example.todolist.domain.timeline.Timeline;
import com.example.todolist.domain.timeline.TimelineRepository;
import com.example.todolist.domain.user.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

import static com.example.todolist.web.utils.HttpSessionUtils.getUserFromSession;

@RestController
public class TimelineController {

    private final Logger logger = LoggerFactory.getLogger(TimelineController.class);
    public final TimelineRepository timelineRepository;

    public TimelineController(TimelineRepository timelineRepository) {
        this.timelineRepository = timelineRepository;
    }

    @GetMapping("/timelines")
    public List<Timeline> showTimeline(HttpSession session) {
        logger.info("타임라인 리스트 요청");
        User sessionUser = getUserFromSession(session);
        return timelineRepository.findAllByAuthor(sessionUser.getId());
    }

}
