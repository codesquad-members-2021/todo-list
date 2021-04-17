package com.codesquad.todo.web.domain;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TodoColumnRepository extends CrudRepository<TodoColumn, Long> {
    @Override
    List<TodoColumn> findAll();
}
