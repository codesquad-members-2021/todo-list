package com.example.todolist.service;

import com.example.todolist.domain.user.User;
import com.example.todolist.domain.user.UserRepository;
import com.example.todolist.web.exception.ErrorMessage;
import com.example.todolist.web.exception.UserAccountException;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User login(String userId, String password) {
        return userRepository.findByUserIdAndPassword(userId, password).orElseThrow(
                () -> new UserAccountException());
    }

}
