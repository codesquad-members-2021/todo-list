package com.team08.todolist.repository;

import com.team08.todolist.model.History;
import org.springframework.data.repository.CrudRepository;

public interface HistoryRepository extends CrudRepository<History, Long> {
}
