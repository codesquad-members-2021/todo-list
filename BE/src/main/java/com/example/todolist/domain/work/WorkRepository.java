package com.example.todolist.domain.work;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkRepository extends CrudRepository<Work, Long> {

    List<Work> findAllByAuthor(Long author);

}
