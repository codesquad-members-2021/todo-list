package com.example.todolist.controller;


import com.example.todolist.domain.Card;
import com.example.todolist.domain.User;
import com.example.todolist.repository.CardRepository;
import com.example.todolist.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@RestController
@RequestMapping("/cards")
public class CardController {

    public final CardRepository cardRepository;
    public final UserRepository userRepository;

    @Autowired
    public CardController(CardRepository cardRepository, UserRepository userRepository) {
        this.cardRepository = cardRepository;
        this.userRepository = userRepository;
    }

    public User getUserFromToken(HttpServletRequest request) {
        return (User) request.getAttribute("user");
    }

    @PostMapping
    public ResponseEntity<Card> create(@RequestBody HashMap<String, String> cardInfo, HttpServletRequest request) {
        User tokenUser = getUserFromToken(request);
        Card card = new Card(tokenUser, cardInfo.get("title"), cardInfo.get("contents"), cardInfo.get("status"));
        cardRepository.save(card);
        return new ResponseEntity<>(card, HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity update(HttpServletRequest request, @PathVariable Long id, @RequestBody HashMap<String, String> newCardInfo) {
        Card card = cardRepository.findById(id).orElseThrow(RuntimeException::new);
        System.out.println("card: " + card.toString());
        User user = getUserFromToken(request);
        System.out.println("user: " + user.toString());
        if (!card.getUserId().equals(user.getUserId())) {
            throw new RuntimeException("수정 권한이 없습니다.");
        }
        card.update(newCardInfo.get("title"), newCardInfo.get("contents"));
        cardRepository.save(card);
        return new ResponseEntity(card, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity delete(@PathVariable Long id, HttpSession session, HttpServletRequest request) {
        Card card = cardRepository.findById(id).orElseThrow(RuntimeException::new);
        User tokeUser = getUserFromToken(request);
        if (!card.getUserId().equals(tokeUser.getUserId())) {
            throw new RuntimeException("삭제 권한이 없습니다.");
        }
        cardRepository.delete(card);
        return new ResponseEntity(card, HttpStatus.OK);
    }
}

