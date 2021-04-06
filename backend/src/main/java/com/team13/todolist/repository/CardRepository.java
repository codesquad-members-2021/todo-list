package com.team13.todolist.repository;

import com.team13.todolist.model.Card;
import org.springframework.data.repository.CrudRepository;

public interface CardRepository extends CrudRepository<Card, Long> {
}
