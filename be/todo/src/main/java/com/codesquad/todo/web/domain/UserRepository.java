package com.codesquad.todo.web.domain;

import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<TodoUser, Long> {

}
