package com.example.todolist.controller;

import com.example.todolist.domain.Card;
import com.example.todolist.domain.User;
import com.example.todolist.repository.CardRepository;
import com.example.todolist.repository.UserRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class CardController {

    public final CardRepository cardRepository;
    public final UserRepository userRepository;

    public CardController(CardRepository cardRepository, UserRepository userRepository) {
        this.cardRepository = cardRepository;
        this.userRepository = userRepository;
    }

    @PostMapping("/create")
    public Card create(String title, String contents, HttpSession session) {
        Long userId = 1L;
        User user = userRepository.findById(userId).orElseThrow(RuntimeException::new);
        System.out.println(user);
        session.setAttribute("sessionUser", user);
        Card card = new Card(user, title, contents, "to-do");
        cardRepository.save(card);
        return card;
    }

    @GetMapping("/test")
    public void show(Card card) {

    }
}
