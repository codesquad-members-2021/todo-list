package com.team08.todolist.repository;

import com.team08.todolist.model.Card;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface CardRepository extends CrudRepository<Card, Long> {

    @Override
    @Query("SELECT CID, TITLE, CONTENT, `DATE`, POS, COLUMN_ID, AUTHOR, IF(`CARD`.IS_APP, 'true', 'false') as IS_APP from `CARD`")
    List<Card> findAll();

    @Override
    @Query("SELECT CID, TITLE, CONTENT, `DATE`, POS, COLUMN_ID, AUTHOR, IF(`CARD`.IS_APP, 'true', 'false') as IS_APP from `CARD` WHERE CID=:cardId")
    Optional<Card> findById(Long cardId);

}
