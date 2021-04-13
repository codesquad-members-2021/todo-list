package com.example.todolist.repository;

import com.example.todolist.domain.CardLog;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CardLogRepository extends CrudRepository<CardLog, Long> {
}
