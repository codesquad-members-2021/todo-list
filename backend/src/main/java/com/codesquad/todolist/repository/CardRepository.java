package com.codesquad.todolist.repository;

import com.codesquad.todolist.domain.Card;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CardRepository extends CrudRepository<Card, Long> {

    @Query("SELECT * FROM CARD WHERE CARD.COLUMN_ID=1")
    public List<Card> findTodoCards();

    @Query("SELECT * FROM CARD WHERE CARD.COLUMN_ID=2")
    public List<Card> findDoingCards();

    @Query("SELECT * FROM CARD WHERE CARD.COLUMN_ID=3")
    public List<Card> findDoneCards();
}
