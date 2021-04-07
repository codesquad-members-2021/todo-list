package team9.todo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team9.todo.domain.User;
import team9.todo.repository.UserRepository;

@RestController
@RequestMapping("/users")
public class ApiUserController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final UserRepository userRepository;

    @Autowired
    public ApiUserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/create")
    public User create() {
        User user = new User();
        user.setName("Hoyoung Jung");
        User savedUser = userRepository.save(user);
        logger.debug("saved: {}", savedUser);
        User u1 = userRepository.findById(1L).get();
        logger.debug("user with id=1: {}", u1);
        return u1;
    }
}
