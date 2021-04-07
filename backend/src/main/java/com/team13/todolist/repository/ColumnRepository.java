package com.team13.todolist.repository;

import com.team13.todolist.model.Column;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ColumnRepository extends CrudRepository<Column, Long> {

    @Override
    List<Column> findAll();
}
