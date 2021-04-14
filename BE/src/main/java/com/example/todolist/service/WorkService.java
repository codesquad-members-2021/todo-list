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

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

import static com.example.todolist.web.dto.WorkResponseDTO.buildResponseWorkDTO;
import static com.example.todolist.web.utils.TimelineContent.makeTimelineContent;
import static com.example.todolist.web.utils.TimelineContent.moveContent;

@Service
public class WorkService {

    private final static String SAVE = "save";
    private final static String UPDATE = "update";
    private final static String DELETE = "delete";

    private final WorkRepository workRepository;
    private final TimelineRepository timelineRepository;

    public WorkService(WorkRepository workRepository, TimelineRepository timelineRepository) {
        this.workRepository = workRepository;
        this.timelineRepository = timelineRepository;
    }

    public List<WorkResponseDTO> getWorks(User sessionUser) {
        return workRepository.findAllByAuthorId(sessionUser.getId()).stream()
                .filter(Work::isNotDeleted)
                .map(work -> buildResponseWorkDTO(work, sessionUser))
                .collect(Collectors.toList());
    }

    public WorkResponseDTO save(CreateWorkRequestDTO workDTO, User sessionUser) {
        Work work = workDTO.toEntity();
        work.saveAuthorId(sessionUser);
        Work saveWork = workRepository.save(work);
        saveTimeline(work, makeTimelineContent(work, SAVE));
        return buildResponseWorkDTO(saveWork, sessionUser);
    }

    public WorkResponseDTO update(Long id, UpdateWorkRequestDTO workDTO, User sessionUser) {
        Work work = getVerifiedWork(id, sessionUser);
        work.update(workDTO.toEntity());
        workRepository.save(work);
        saveTimeline(work, makeTimelineContent(work, UPDATE));
        return buildResponseWorkDTO(work, sessionUser);
    }

    public void delete(Long id, User sessionUser) {
        Work work = getVerifiedWork(id, sessionUser);
        work.delete();
        saveTimeline(work, makeTimelineContent(work, DELETE));
        workRepository.save(work);
    }

    public WorkResponseDTO move(Long id, MoveWorkRequestDTO workDTO, User sessionUser) {
        Work work = getVerifiedWork(id, sessionUser);
        work.move(workDTO.toEntity().getStatus());
        workRepository.save(work);
        saveTimeline(work, moveContent(work, workDTO));
        return buildResponseWorkDTO(work, sessionUser);
    }

    public void saveTimeline(Work work, String content) {
        timelineRepository.save(Timeline.builder()
                .content(content)
                .authorId(work.getAuthorId())
                .createdAt(LocalDateTime.now())
                .build());
    }

    private Work getVerifiedWork(Long id, User sessionUser) {
        Work work = workRepository.findById(id).orElseThrow(
                () -> new EntityRelatedException(ErrorMessage.ENTITY_NOT_FOUND));
        if (!work.matchAuthor(sessionUser)) {
            throw new IllegalUserAccessException();
        }
        return work;
    }

}
