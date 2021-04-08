package com.example.todolist.controller;

import com.example.todolist.JwtAuthInterceptor;
import com.example.todolist.JwtUtil;
import com.example.todolist.domain.Card;
import com.example.todolist.domain.User;
import com.example.todolist.repository.CardRepository;
import com.example.todolist.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;


@RestController
@RequestMapping("/cards")
public class CardController {

    public final CardRepository cardRepository;
    public final UserRepository userRepository;
    private final JwtAuthInterceptor jwtAuthInterceptor;

    @Autowired
    public CardController(CardRepository cardRepository, UserRepository userRepository, JwtAuthInterceptor jwtAuthInterceptor) {
        this.cardRepository = cardRepository;
        this.userRepository = userRepository;
        this.jwtAuthInterceptor = jwtAuthInterceptor;
    }

//    @PostMapping
//    public ResponseEntity<Card> create(@RequestBody HashMap<String, String> cardInfo, HttpSession session) {
//        User user = (User) session.getAttribute("sessionUser");
//        System.out.println("in create:" + user.toString());
//        Card card = new Card(user, cardInfo.get("title"), cardInfo.get("content"), cardInfo.get("status"));
//        cardRepository.save(card);
//        return new ResponseEntity<>(card, HttpStatus.OK);
//    }

    @PostMapping
    public ResponseEntity<Card> create(@RequestBody HashMap<String, String> cardInfo) throws Exception {
        //        String userId = request.getParameter("userId");
//        System.out.println(userId);
//                User user = userRepository.findById(Long.parseLong(request.getHeader("userId")))
//                .orElseThrow(IllegalArgumentException::new);
        String jwt = jwtAuthInterceptor.getJwt();
        User user = userRepository.findByToken(jwt);
//        User user = new User("rororo", "1234");
        Card card = new Card(user, cardInfo.get("title"), cardInfo.get("contents"), cardInfo.get("status"));
        cardRepository.save(card);
        return new ResponseEntity<>(card, HttpStatus.OK);
//        return new ResponseEntity<>(HttpStatus.OK);
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
    public ResponseEntity delete(@PathVariable Long id, HttpSession session) {
        Card card = cardRepository.findById(id).orElseThrow(RuntimeException::new);
        User user = (User) session.getAttribute("sessionUser");
        if (!card.getUserId().equals(user.getUserId())) {
            throw new RuntimeException("삭제 권한이 없습니다.");
        }
        cardRepository.delete(card);
        return new ResponseEntity(card, HttpStatus.OK);
    }
}
