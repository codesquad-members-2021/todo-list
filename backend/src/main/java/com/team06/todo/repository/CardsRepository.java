package com.team06.todo.repository;

import com.team06.todo.domain.Card;
import org.springframework.data.repository.CrudRepository;

public interface CardsRepository extends CrudRepository<Card, Long> {
}
