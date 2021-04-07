package com.example.todolist.repository;

import com.example.todolist.domain.Card;
import org.springframework.data.repository.CrudRepository;

public interface CardRepository extends CrudRepository<Card, Long> {
}
