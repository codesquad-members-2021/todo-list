package com.example.todolist.web;

import com.example.todolist.service.TimelineService;
import com.example.todolist.web.dto.ResponseTimelineDto;
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
    public final TimelineService timelineService;

    public TimelineController(TimelineService timelineService) {
        this.timelineService = timelineService;
    }

    @GetMapping("/timelines")
    public List<ResponseTimelineDto> showTimeline(HttpSession session) {
        logger.info("타임라인 리스트 요청");
        return timelineService.getTimelines(getUserFromSession(session));
    }

}
