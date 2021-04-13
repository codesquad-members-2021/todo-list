package com.example.todolist.repository;

import com.example.todolist.domain.Card;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CardRepository extends CrudRepository<Card, Long> {
    @Query("SELECT id, user_id, title, contents, status, post_time FROM card WHERE status = :status and is_deleted = 0 ORDER BY post_time DESC")
    List<Card> findAllByStatus(@Param("status") String status);
}
