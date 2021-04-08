package com.team13.todolist.repository;

import com.team13.todolist.model.ToDoList;
import org.springframework.data.repository.CrudRepository;

public interface ToDoListRepository extends CrudRepository<ToDoList, Long> {

}
