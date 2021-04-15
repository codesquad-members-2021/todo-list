package com.example.todolist.service;


import com.example.todolist.exception.UserNotFoundException;
import com.example.todolist.repository.UserRepository;
import org.springframework.stereotype.Service;
import com.example.todolist.domain.User;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User findUserById(Long id) {
        return userRepository.findById(id).orElseThrow(UserNotFoundException::new);
    }

    public User findUserByName(String userName){
        return userRepository.findByName(userName).orElseThrow(UserNotFoundException::new);
    }

}
