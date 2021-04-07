package codesquad.TodoList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/cards")
public class CardController {

    // CREATE
    @PostMapping
    public void newCard() {

    }
    // READ
    @GetMapping
    @ResponseBody
    public void showCards() {

    }
    // MOVE
    @PutMapping("/{id}/status")
    public void moveCards() {

    }

    // UPDATE
    @PutMapping("/{id}")
    public void editCards() {

    }
    // DELETE
    @DeleteMapping
    public void deleteCards() {

    }
}
