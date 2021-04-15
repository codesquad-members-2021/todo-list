package com.example.todolist.service;

import com.example.todolist.domain.timeline.Timeline;
import com.example.todolist.domain.timeline.TimelineRepository;
import com.example.todolist.domain.user.User;
import com.example.todolist.domain.work.Work;
import com.example.todolist.web.dto.MoveWorkRequestDTO;
import com.example.todolist.web.dto.TimelineResponseDTO;
import com.example.todolist.web.utils.Action;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
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

    public void editByAction(Work work, Action action) {
        saveTimeline(work, makeTimelineContent(work, action));
    }

    public void move(Work work, MoveWorkRequestDTO workDTO) {
        saveTimeline(work, moveContent(work, workDTO));
    }

    private void saveTimeline(Work work, String content) {
        timelineRepository.save(Timeline.builder()
                .content(content)
                .authorId(work.getAuthorId())
                .createdAt(LocalDateTime.now())
                .build());
    }

    private String makeTimelineContent(Work work, Action action) {
        StringBuilder contentBuilder = new StringBuilder();
        contentBuilder.append(work.getStatus().getComment() + "에 ");
        contentBuilder.append(verifyJongsung(work.getTitle(), "을 ", "를 "));
        contentBuilder.append(action.getValue());
        return contentBuilder.toString();
    }

    private String moveContent(Work work, MoveWorkRequestDTO workDTO) {
        StringBuilder contentBuilder = new StringBuilder();
        contentBuilder.append(verifyJongsung(work.getTitle(), "을 ", "를 "));
        contentBuilder.append(work.getStatus().getComment() + "에서 ");
        contentBuilder.append(workDTO.toEntity().getStatus().getComment() + "로 " + Action.MOVE.getValue());
        return contentBuilder.toString();
    }

    private String verifyJongsung(String title, String firstValue, String secondValue) {
        char lastTitle = title.charAt(title.length() - 1);
        //한글의 제일 처음과 끝의 범위밖일 경우는 오류
        if (lastTitle < 0xAC00 || lastTitle > 0xD7A3) {
            return "\"" + title + "\"" + "을(를) ";
        }
        String seletedValue = (lastTitle - 0xAC00) % 28 > 0 ? firstValue : secondValue;
        return "\"" + title + "\"" + seletedValue;
    }

}
