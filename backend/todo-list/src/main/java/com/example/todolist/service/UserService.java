package com.example.todolist.service;


import com.example.todolist.repository.UserRepository;
import org.springframework.stereotype.Service;
import com.example.todolist.domain.User;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User findUserByName(String userName){
        User user = userRepository.findByName(userName);
        return user;
    }

}
