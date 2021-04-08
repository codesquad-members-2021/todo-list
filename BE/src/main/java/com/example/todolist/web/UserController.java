package com.example.todolist.web;

import com.example.todolist.domain.user.UserRepository;
import com.example.todolist.domain.user.User;
import com.example.todolist.domain.work.Work;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/test")
    public User test() {
        User user = new User("eno", "1234", "enojung", "naver");
        User saveUser = userRepository.save(user);
        System.out.println(saveUser);
        return saveUser;
    }






}
