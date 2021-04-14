package com.team08.todolist.repository;

import com.team08.todolist.model.Card;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CardRepository extends CrudRepository<Card, Long> {

    @Override
    @Query("SELECT CID, TITLE, CONTENT, `DATE`, POS, COLUMNID, AUTHOR, IF(`CARD`.ISAPP, 'true', 'false') as ISAPP from `CARD`")
    List<Card> findAll();
}
