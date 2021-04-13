package com.example.todolist.service;

import com.example.todolist.domain.User;
import com.example.todolist.repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User findUserByToken(String token) {
        return userRepository.findByToken(token);
    }
}
