package com.codesquad.todo.web.domain;

import org.springframework.data.repository.CrudRepository;

public interface TodoTaskRepository extends CrudRepository<TodoTask, Long> {

}
