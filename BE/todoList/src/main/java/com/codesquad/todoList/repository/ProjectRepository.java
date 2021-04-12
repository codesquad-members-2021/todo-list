package com.codesquad.todoList.repository;

import com.codesquad.todoList.entity.Project;
import org.springframework.data.repository.CrudRepository;

public interface ProjectRepository extends CrudRepository<Project, Long> {
}
