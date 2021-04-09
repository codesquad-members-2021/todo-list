package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.model.Card;
import com.codeSquad.cocokyu.domain.model.Log;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CardRepository extends CrudRepository<Card, Long> {
    @Query("select * from card c where not c.status = 'DELETED' ORDER BY c.create_date_time DESC")
    Iterable<Card> findByCardToNotDeleted();

    @Query("select * from log ORDER BY create_date_time DESC")
    List<Log> findAllLog();
}

