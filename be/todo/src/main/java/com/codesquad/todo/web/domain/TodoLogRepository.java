package com.codesquad.todo.web.domain;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TodoLogRepository extends CrudRepository<TodoLog, Long> {

    @Query("SELECT ID, ACTION, FROM_COLUMN_TITLE, TO_COLUMN_TITLE, TASK_TITLE, CREATED_DATE_TIME\n" +
            "FROM TODO_LOG WHERE TODO_USER=:todoUser \n" +
            "ORDER BY CREATED_DATE_TIME DESC")
    List<TodoLog> findFiveTodoLogByUser(@Param("todoUser") Long todoUser);

}
