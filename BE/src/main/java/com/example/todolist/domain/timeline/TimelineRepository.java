package com.example.todolist.domain.timeline;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TimelineRepository extends CrudRepository<Timeline, Long> {

    List<Timeline> findAllByAuthor(Long author);

}
