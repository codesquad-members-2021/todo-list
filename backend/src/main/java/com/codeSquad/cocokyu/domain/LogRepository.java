package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.model.Log;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LogRepository extends CrudRepository<Log, Long> {

    @Query("select * from log ORDER BY create_date_time DESC")
    List<Log> findAllLog();
}
