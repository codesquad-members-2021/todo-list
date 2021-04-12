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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import static com.example.todolist.web.utils.TimelineDescription.makeTimelineDescription;
import static com.example.todolist.web.utils.TimelineDescription.moveDescription;

@Service
public class WorkService {

    private final Logger logger = LoggerFactory.getLogger(WorkService.class);
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

        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        Timeline timeline = new Timeline(makeTimelineDescription(work, method), saveWork.getAuthor());
        timelineRepository.save(timeline);
        return new ResponseWorkDto(saveWork, sessionUser);
    }

    public ResponseWorkDto update(Long id, RequestUpdateWorkDto workDto, User sessionUser) {
        Work work = verifyWork(id, sessionUser);
        work.update(workDto.toEntity());
        workRepository.save(work);

        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        Timeline timeline = new Timeline(makeTimelineDescription(work, method), work.getAuthor());
        timelineRepository.save(timeline);
        return new ResponseWorkDto(work, sessionUser);
    }

    public void delete(Long id, User sessionUser) {
        Work work = verifyWork(id, sessionUser);
        work.delete();

        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        Timeline timeline = new Timeline(makeTimelineDescription(work, method), work.getAuthor());
        timelineRepository.save(timeline);
        workRepository.save(work);
    }

    public ResponseWorkDto move(Long id, RequestMoveWorkDto workDto, User sessionUser) {
        Work work = verifyWork(id, sessionUser);
        int to = work.getStatus();
        logger.info(String.valueOf(to));

        work.move(workDto.toEntity());
        int from = work.getStatus();

        logger.info(String.valueOf(from));

        Timeline timeline = new Timeline(moveDescription(work, to, from), work.getAuthor());
        logger.info(timeline.toString());
        workRepository.save(work);
        timelineRepository.save(timeline);
        return new ResponseWorkDto(work, sessionUser);
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
