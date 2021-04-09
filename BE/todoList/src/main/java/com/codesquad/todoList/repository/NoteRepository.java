package com.codesquad.todoList.repository;

import com.codesquad.todoList.entity.Action;
import com.codesquad.todoList.entity.Note;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface NoteRepository extends CrudRepository<Note, Long> {

    List<Note> findAll();

}
