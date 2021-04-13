package com.codesquad.todoList.service;

import com.codesquad.todoList.entity.Action;
import com.codesquad.todoList.entity.Note;
import com.codesquad.todoList.repository.NoteRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoteService {

    private final NoteRepository noteRepository;

    public void save(Note note) {
        noteRepository.save(note);
    }

    public List<Note> getNotes() {
        return noteRepository.findAll();
    }

}
