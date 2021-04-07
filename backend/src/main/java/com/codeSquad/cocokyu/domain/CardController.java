package com.codeSquad.cocokyu.domain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CardController {

    @Autowired
    private CardRepository cardRepository;

    @GetMapping("/hello")
    public Card hello() {
        return new Card("sample", "Sampleelpee", "open");
    }

}
