package com.example.todolist.domain.work;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface WorkRepository extends CrudRepository<Work, Long> {

    List<Work> findAllByAuthorId(Long authorId);

}
