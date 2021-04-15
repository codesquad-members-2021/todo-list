package com.codesquad.todolist.repository;

import com.codesquad.todolist.domain.History;
import org.springframework.data.repository.CrudRepository;

public interface HistoryRepository extends CrudRepository<History, Long> {
}
