package com.team06.todo.repository;

import com.team06.todo.domain.Action;
import org.springframework.data.repository.CrudRepository;

public interface ActionsRepository extends CrudRepository<Action, Long> {
}
