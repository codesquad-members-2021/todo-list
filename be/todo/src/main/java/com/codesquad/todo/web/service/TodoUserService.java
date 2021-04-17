package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.domain.TodoUserRepository;
import com.codesquad.todo.web.exceptions.TodoUserNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class TodoUserService {
    private final TodoUserRepository todoUserRepository;

    public TodoUserService(TodoUserRepository todoUserRepository) {
        this.todoUserRepository = todoUserRepository;
    }

    public TodoUser findUser(Long id) {
        return todoUserRepository.findById(id).orElseThrow(TodoUserNotFoundException::new);
    }
}
