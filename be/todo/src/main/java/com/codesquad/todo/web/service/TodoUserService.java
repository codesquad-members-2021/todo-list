package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.TodoUser;
import com.codesquad.todo.web.domain.UserRepository;
import com.codesquad.todo.web.exceptions.UserNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class TodoUserService {
    private final UserRepository userRepository;

    public TodoUserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public TodoUser findUser(Long id) {
        return userRepository.findById(id).orElseThrow(UserNotFoundException::new);
    }
}
