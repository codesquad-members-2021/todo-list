package com.example.todolist.service;

import com.example.todolist.domain.user.User;
import com.example.todolist.domain.work.Work;
import com.example.todolist.domain.work.WorkRepository;
import com.example.todolist.exception.EntityRelatedException;
import com.example.todolist.exception.ErrorMessage;
import com.example.todolist.exception.IllegalUserAccessException;
import com.example.todolist.web.dto.*;
import com.example.todolist.web.utils.Action;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

import static com.example.todolist.web.dto.WorkResponseDTO.buildWorkResponseDTO;

@Service
public class WorkService {

    private final WorkRepository workRepository;
    private final TimelineService timelineService;

    public WorkService(WorkRepository workRepository, TimelineService timelineService) {
        this.workRepository = workRepository;
        this.timelineService = timelineService;
    }

    public List<WorkResponseDTO> getWorks(User sessionUser) {
        return workRepository.findAllByAuthorId(sessionUser.getId()).stream()
                .filter(Work::isNotDeleted)
                .map(work -> buildWorkResponseDTO(work, sessionUser))
                .collect(Collectors.toList());
    }

    @Transactional
    public WorkResponseDTO save(CreateWorkRequestDTO workDTO, User sessionUser) {
        Work work = workDTO.toEntity();
        work.saveAuthorId(sessionUser);
        timelineService.editByAction(work, Action.SAVE);
        Work saveWork = workRepository.save(work);
        return buildWorkResponseDTO(saveWork, sessionUser);
    }

    @Transactional
    public WorkResponseDTO update(Long id, UpdateWorkRequestDTO workDTO, User sessionUser) {
        Work work = getVerifiedWork(id, sessionUser);
        timelineService.editByAction(work, Action.UPDATE);
        work.update(workDTO.toEntity());
        workRepository.save(work);
        return buildWorkResponseDTO(work, sessionUser);
    }

    @Transactional
    public void delete(Long id, User sessionUser) {
        Work work = getVerifiedWork(id, sessionUser);
        timelineService.editByAction(work, Action.DELETE);
        work.delete();
        workRepository.save(work);
    }

    @Transactional
    public WorkResponseDTO move(Long id, MoveWorkRequestDTO workDTO, User sessionUser) {
        Work work = getVerifiedWork(id, sessionUser);
        work.move(workDTO.toEntity().getStatus());
        workRepository.save(work);
        timelineService.move(work, workDTO);
        return buildWorkResponseDTO(work, sessionUser);
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
