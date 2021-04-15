package com.team08.todolist.repository;

import com.team08.todolist.model.History;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface HistoryRepository extends CrudRepository<History, Long> {

    @Override
    List<History> findAll();
}
