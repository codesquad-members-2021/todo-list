package team9.todo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import team9.todo.domain.User;
import team9.todo.repository.UserRepository;

import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("/api/users")
public class ApiUserController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final UserRepository userRepository;

    @Autowired
    public ApiUserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping
    @ResponseStatus(code = HttpStatus.CREATED)
    public User join(@RequestBody User user) {
        logger.debug("회원가입 요청: {}", user.getUserId());
        return userRepository.save(user);
    }

    @PostMapping("/login")
    @ResponseStatus(code = HttpStatus.NO_CONTENT)
    public void login(@RequestBody User user, HttpSession httpSession) {
        logger.debug("로그인 요청: {}", user.getUserId());
    }

    @PostMapping("/logout")
    @ResponseStatus(code = HttpStatus.NO_CONTENT)
    public void logout(HttpSession httpSession) {
        logger.debug("로그아웃 요청: ");
    }
}
