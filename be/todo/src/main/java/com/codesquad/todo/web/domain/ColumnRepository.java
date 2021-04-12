package com.codesquad.todo.web.domain;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ColumnRepository extends CrudRepository<Column, Long> {
    @Override
    List<Column> findAll();
}
