package com.example.todolist.service;

import com.example.todolist.domain.timeline.Timeline;
import com.example.todolist.domain.timeline.TimelineRepository;
import com.example.todolist.domain.user.User;
import com.example.todolist.domain.work.Work;
import com.example.todolist.domain.work.WorkRepository;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;
import com.example.todolist.exception.IllegalUserAccessException;
import com.example.todolist.web.dto.*;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import static com.example.todolist.web.utils.TimelineDescription.makeTimelineDescription;
import static com.example.todolist.web.utils.TimelineDescription.moveDescription;

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
                .filter(Work::isNotDeleted)
                .map(work -> new ResponseWorkDto(work, sessionUser))
                .collect(Collectors.toList());
    }

    public ResponseWorkDto save(RequestCreateWorkDto workDto, User sessionUser) {
        Work work = workDto.toEntity();
        work.save(sessionUser);
        Work saveWork = workRepository.save(work);
        saveTimeline(work, makeTimelineDescription(work, "save"));
        return new ResponseWorkDto(saveWork, sessionUser);
    }

    public ResponseWorkDto update(Long id, RequestUpdateWorkDto workDto, User sessionUser) {
        Work work = verifyWork(id, sessionUser);
        work.update(workDto.toEntity());
        workRepository.save(work);
        saveTimeline(work, makeTimelineDescription(work, "update"));
        return new ResponseWorkDto(work, sessionUser);
    }

    public void delete(Long id, User sessionUser) {
        Work work = verifyWork(id, sessionUser);
        work.delete();
        saveTimeline(work, makeTimelineDescription(work, "delete"));
        workRepository.save(work);
    }

    public ResponseWorkDto move(Long id, RequestMoveWorkDto workDto, User sessionUser) {
        Work work = verifyWork(id, sessionUser);
        work.move(workDto.toEntity());
        workRepository.save(work);
        saveTimeline(work, moveDescription(work, workDto));
        return new ResponseWorkDto(work, sessionUser);
    }

    public void saveTimeline(Work work, String description) {
        timelineRepository.save(new Timeline(description, work.getAuthor()));
    }

    private Work verifyWork(Long id, User sessionUser) {
        Work work = workRepository.findById(id).orElseThrow(
                () -> new EntityRelatedException(ErrorMessage.ENTITY_NOT_FOUND));
        if (!work.matchAuthor(sessionUser)) {
            throw new IllegalUserAccessException();
        }
        return work;
    }

}
