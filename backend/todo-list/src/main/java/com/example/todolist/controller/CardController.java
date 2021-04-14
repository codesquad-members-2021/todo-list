package com.example.todolist.controller;


import com.example.todolist.CustomResolver;
import com.example.todolist.domain.*;
import com.example.todolist.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;

@RestController
@RequestMapping("/cards")
public class CardController {

    public final CardRepository cardRepository;
    public final UserRepository userRepository;
    public final HistoryRepository cardLogRepository;

    @Autowired
    public CardController(CardRepository cardRepository, UserRepository userRepository, HistoryRepository cardLogRepository) {
        this.cardRepository = cardRepository;
        this.userRepository = userRepository;
        this.cardLogRepository = cardLogRepository;
    }

//    public String getUserNameFromToken(HttpServletRequest request) {
//        return (String) request.getAttribute("name");
//    }


    @PostMapping
    public ResponseEntity<Card> create(@RequestBody HashMap<String, String> cardInfo, @CustomResolver String userName) {
        User user = userRepository.findByName(userName);
        Card card = new Card(user, cardInfo.get("title"), cardInfo.get("contents"), cardInfo.get("status"));
        cardRepository.save(card);
        History log = new History(card, "add");
        cardLogRepository.save(log);
        return new ResponseEntity<>(card, HttpStatus.OK);
    }

    @PutMapping("/{id}/edit")
    public ResponseEntity<Card> update(@PathVariable Long id, @RequestBody HashMap<String, String> newCardInfo, @CustomResolver String userName) {
        Card card = cardRepository.findById(id).orElseThrow(RuntimeException::new);
        User user = userRepository.findByName(userName);
        if (!card.getUserId().equals(user.getUserId())) {
            throw new RuntimeException("수정 권한이 없습니다.");
        }
        card.update(newCardInfo.get("title"), newCardInfo.get("contents"));
        cardRepository.save(card);
        History log = new History(card, "update");
        cardLogRepository.save(log);
        return new ResponseEntity<>(card, HttpStatus.OK);
    }

    @PutMapping("/{id}/status")
    public ResponseEntity<Card> move( @PathVariable Long id, @RequestBody HashMap<String, String> newCardInfo,@CustomResolver String userName) {
        Card card = cardRepository.findById(id).orElseThrow(RuntimeException::new);
        User user = userRepository.findByName(userName);
        if (!card.getUserId().equals(user.getUserId())) {
            throw new RuntimeException("수정 권한이 없습니다.");
        }
        String preStatus = card.getStatus();
        card.update(newCardInfo.get("status"));
        cardRepository.save(card);
        History log = new History(card, "move", preStatus);
        cardLogRepository.save(log);
        return new ResponseEntity<>(card, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Card> delete(@PathVariable Long id,@CustomResolver String userName) {
        Card card = cardRepository.findById(id).orElseThrow(RuntimeException::new);
        User user = userRepository.findByName(userName);
        if (!card.getUserId().equals(user.getUserId())) {
            throw new RuntimeException("삭제 권한이 없습니다.");
        }
        History log = new History(card, "remove");
        card.delete();
        cardLogRepository.save(log);
        cardRepository.save(card);
        return new ResponseEntity<>(card, HttpStatus.OK);
    }

}

