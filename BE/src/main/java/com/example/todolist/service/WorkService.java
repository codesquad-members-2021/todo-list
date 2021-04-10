package com.example.todolist.service;

import com.example.todolist.domain.timeline.TimelineRepository;
import com.example.todolist.domain.user.User;
import com.example.todolist.domain.work.Work;
import com.example.todolist.domain.work.WorkRepository;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;
import com.example.todolist.exception.IllegalUserAccessException;
import com.example.todolist.web.dto.RequestCreateWorkDto;
import com.example.todolist.web.dto.RequestMoveWorkDto;
import com.example.todolist.web.dto.RequestUpdateWorkDto;
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
                .filter(Work::isNotDeleted)
                .map(work -> new ResponseWorkDto(work, sessionUser))
                .collect(Collectors.toList());
    }

    public ResponseWorkDto save(RequestCreateWorkDto workDto, User sessionUser) {
        Work work = workDto.toEntity();
        work.save(sessionUser);
        Work saveWork = workRepository.save(work);
        return new ResponseWorkDto(saveWork, sessionUser);
    }

    public ResponseWorkDto update(Long id, RequestUpdateWorkDto workDto, User sessionUser) {
        Work work = verifyWork(id, sessionUser);
        work.update(workDto.toEntity());
        workRepository.save(work);
        return new ResponseWorkDto(work, sessionUser);
    }

    public void delete(Long id, User sessionUser) {
        Work work = verifyWork(id, sessionUser);
        work.delete();
        workRepository.save(work);
    }

    public ResponseWorkDto move(Long id, RequestMoveWorkDto workDto, User sessionUser) {
        Work work = verifyWork(id, sessionUser);
        work.move(workDto.toEntity());
        workRepository.save(work);
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
