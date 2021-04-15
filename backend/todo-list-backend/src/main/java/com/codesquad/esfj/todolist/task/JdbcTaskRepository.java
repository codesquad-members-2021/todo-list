package com.codesquad.esfj.todolist.task;

import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface JdbcTaskRepository extends CrudRepository<Task, Long> {
    List<Task> findAllByDeletedFalse();
    List<Task> findAllByTaskTypeAndDeletedFalse(String taskType);
    Optional<Task> findByPreviousIdAndTaskType(Long id, String taskType);
    Optional<Task> findByPreviousId(Long previousId);
}
