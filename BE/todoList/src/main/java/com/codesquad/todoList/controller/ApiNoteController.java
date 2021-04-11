package com.codesquad.todoList.controller;

import com.codesquad.todoList.entity.Note;
import com.codesquad.todoList.service.NoteService;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/notes")
@AllArgsConstructor
public class ApiNoteController {

    private static final Logger log = LoggerFactory.getLogger(ApiNoteController.class);

    private final NoteService noteService;

    @PostMapping
    public ResponseEntity<?> addNote(@RequestBody Note note, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            log.error("ERROR ");
            return ResponseEntity.notFound().build();
        }
        log.info("Note : {}", note);
        noteService.save(note);
        return ResponseEntity.ok().build();
    }

    @GetMapping
    public ResponseEntity<?> getNotes() {
        final List<Note> notes = noteService.getNotes();
        return ResponseEntity.ok().body(notes);
    }

}
