package com.codesquad.todolist.repository;

import com.codesquad.todolist.domain.Card;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CardRepository extends CrudRepository<Card, Long> {

    @Query("SELECT * FROM CARD WHERE CARD.COLUMN_ID=1 ORDER BY FLAG ASC")
    List<Card> findTodoCards();

    @Query("SELECT * FROM CARD WHERE CARD.COLUMN_ID=2 ORDER BY FLAG ASC")
    List<Card> findDoingCards();

    @Query("SELECT * FROM CARD WHERE CARD.COLUMN_ID=3 ORDER BY FLAG ASC")
    List<Card> findDoneCards();

    @Query("SELECT FLAG FROM CARD WHERE CARD.COLUMN_ID=1 ORDER BY FLAG ASC")
    List<Double> findTodoFlags();

    @Query("SELECT FLAG FROM CARD WHERE CARD.COLUMN_ID=2 ORDER BY FLAG ASC")
    List<Double> findDoingFlags();

    @Query("SELECT FLAG FROM CARD WHERE CARD.COLUMN_ID=3 ORDER BY FLAG ASC")
    List<Double> findDoneFlags();

}

