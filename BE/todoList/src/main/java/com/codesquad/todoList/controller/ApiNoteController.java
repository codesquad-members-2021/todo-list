package com.codesquad.todoList.controller;

import com.codesquad.todoList.entity.Note;
import com.codesquad.todoList.service.NoteService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/notes")
@RequiredArgsConstructor
public class ApiNoteController {

    private static final Logger log = LoggerFactory.getLogger(ApiNoteController.class);

    private final NoteService noteService;

    @GetMapping
    public ResponseEntity<?> getNotes() {
        return ResponseEntity.ok().body(noteService.getNotes());
    }

}
