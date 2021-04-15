package com.codesquad.todoList.repository;

import com.codesquad.todoList.entity.Card;
import org.springframework.data.repository.CrudRepository;

public interface CardRepository extends CrudRepository<Card, Long> {
}
