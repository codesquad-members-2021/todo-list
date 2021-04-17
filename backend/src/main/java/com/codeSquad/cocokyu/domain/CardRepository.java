package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.model.Card;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CardRepository extends CrudRepository<Card, Long> {
    @Query("select * from card c where not c.status = 'DELETED' order by create_date_time")
    List<Card> findByCardToNotDeleted();
}

