package com.team08.todolist.repository;

import com.team08.todolist.model.Card;
import org.springframework.data.repository.CrudRepository;

public interface CardRepository extends CrudRepository<Card, Long> {
}
