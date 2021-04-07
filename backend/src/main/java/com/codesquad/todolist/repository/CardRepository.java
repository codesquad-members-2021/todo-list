package com.codesquad.todolist.repository;

import com.codesquad.todolist.domain.Card;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CardRepository extends CrudRepository<Card, Long> {

    List<Card> findAll();

    Optional<Card> findById(Long id);

}
