package com.example.todolist.domain.timeline;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TimelineRepository extends CrudRepository<Timeline, Long> {

    List<Timeline> findAllByAuthorId(Long authorId);

}
