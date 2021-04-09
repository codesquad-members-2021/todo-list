package com.codesquad.todoList.service;

import com.codesquad.todoList.entity.Action;
import com.codesquad.todoList.entity.Note;
import com.codesquad.todoList.repository.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoteService {

    NoteRepository noteRepository;

    @Autowired
    public NoteService(NoteRepository noteRepository) {
        this.noteRepository = noteRepository;
    }

    public void save(Note note) {
        noteRepository.save(note);
    }

    public List<Note> getNotes() {
        return noteRepository.findAll();
    }

}
