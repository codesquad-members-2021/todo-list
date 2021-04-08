package team9.todo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import team9.todo.domain.Card;
import team9.todo.domain.User;
import team9.todo.repository.CardRepository;
import team9.todo.repository.UserRepository;


@RestController
@RequestMapping("/users")
public class ApiUserController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final UserRepository userRepository;
    private final CardRepository cardRepository;

    @Autowired
    public ApiUserController(UserRepository userRepository, CardRepository cardRepository) {
        this.userRepository = userRepository;
        this.cardRepository = cardRepository;
    }

    @GetMapping("/create")
    public User create() {
        User user = new User("honux", "honux");
        User savedUser = userRepository.save(user);
        logger.debug("saved: {}", savedUser);
        User u1 = userRepository.findById(1L).get();
        logger.debug("user with id=1: {}", u1);
        return u1;
    }

    @GetMapping("/createCard")
    public Card createCard() {


        Card card = new Card(1,"asd","asd",1.0,1,0);

        card = cardRepository.save(card);
        logger.debug("saved: {}", card);
        card = cardRepository.findById(1L).get();

        return card;
    }
}
