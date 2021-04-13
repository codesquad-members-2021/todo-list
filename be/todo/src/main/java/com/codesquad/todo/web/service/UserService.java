package com.codesquad.todo.web.service;

import com.codesquad.todo.web.domain.User;
import com.codesquad.todo.web.domain.UserRepository;
import com.codesquad.todo.web.exceptions.UserNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User findUser(Long id) {
        return userRepository.findById(id).orElseThrow(UserNotFoundException::new);
    }
}
