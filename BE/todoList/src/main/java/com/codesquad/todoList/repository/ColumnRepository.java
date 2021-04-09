package com.codesquad.todoList.repository;

import com.codesquad.todoList.entity.Columns;
import org.springframework.data.repository.CrudRepository;

public interface ColumnRepository extends CrudRepository<Columns, Long> {
}
