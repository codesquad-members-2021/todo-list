package com.team13.todolist.repository;

import com.team13.todolist.model.Card;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CardRepository extends CrudRepository<Card, Long> {

    @Override
    List<Card> findAll();
}
