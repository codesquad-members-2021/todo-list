package com.example.todolist;

import com.example.todolist.model.User;
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
        User user = new User("naver", "eno");
        User saveUser = userRepository.save(user);
        System.out.println(saveUser);
        return saveUser;
    }

}
