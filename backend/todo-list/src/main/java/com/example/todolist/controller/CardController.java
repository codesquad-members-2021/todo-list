package com.example.todolist.controller;

import com.example.todolist.domain.Card;
import com.example.todolist.domain.User;
import com.example.todolist.repository.CardRepository;
import com.example.todolist.repository.UserRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;


@RestController
public class CardController {

    public final CardRepository cardRepository;
    public final UserRepository userRepository;

    public CardController(CardRepository cardRepository, UserRepository userRepository) {
        this.cardRepository = cardRepository;
        this.userRepository = userRepository;
    }

    @PostMapping
    public ResponseEntity<Card> create(@RequestBody HashMap<String, String> cardInfo, HttpSession session) {
        User user = (User) session.getAttribute("sessionUser");
        System.out.println("in create:" + user.toString());
        Card card = new Card(user, cardInfo.get("title"), cardInfo.get("content"), cardInfo.get("status"));
        cardRepository.save(card);
        return new ResponseEntity<>(card, HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity update(@PathVariable Long id, @RequestBody HashMap<String, String> newCardInfo, HttpSession session) {
        Card card = cardRepository.findById(id).orElseThrow(RuntimeException::new);
        User user = (User) session.getAttribute("sessionUser");
        if (!card.getUserId().equals(user.getUserId())) {
            throw new RuntimeException("수정 권한이 없습니다.");
        }
        card.update(newCardInfo.get("title"), newCardInfo.get("contents"));
        cardRepository.save(card);
        return new ResponseEntity(card, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity delete (@PathVariable Long id, HttpSession session){
        Card card = cardRepository.findById(id).orElseThrow(RuntimeException::new);
        User user = (User) session.getAttribute("sessionUser");
        if (!card.getUserId().equals(user.getUserId())) {
            throw new RuntimeException("삭제 권한이 없습니다.");
        }
        cardRepository.delete(card);
        return new ResponseEntity(card , HttpStatus.OK);
    }
}
