package com.example.todolist.repository;

import com.example.todolist.domain.History;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HistoryRepository extends CrudRepository<History, Long> {
    @Query("SELECT * FROM history ORDER BY action_time DESC")
    List<History> findHistoryList();
}
