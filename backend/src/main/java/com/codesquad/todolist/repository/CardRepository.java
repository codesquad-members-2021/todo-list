package com.codesquad.todolist.repository;

import com.codesquad.todolist.domain.Card;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CardRepository extends CrudRepository<Card, Long> {

    @Query("SELECT * FROM CARD WHERE CARD.COLUMN_ID LIKE CONCAT('%',:columnId,'%') ORDER BY FLAG ASC")
    List<Card> findCardsByColumnId(@Param("columnId") Long columnId);

    @Query("SELECT FLAG FROM CARD WHERE CARD.COLUMN_ID LIKE CONCAT('%',:columnId,'%') ORDER BY FLAG ASC")
    List<Double> findFlagsByColumnId(@Param("columnId") Long columnId);
}

