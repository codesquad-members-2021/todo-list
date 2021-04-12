package com.codesquad.todo.web.domain;

import org.springframework.data.repository.CrudRepository;

public interface TodoLogRepository extends CrudRepository<TodoLog, Long> {
    
}
