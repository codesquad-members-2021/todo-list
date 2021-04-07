package com.codeSquad.cocokyu.domain;

import com.codeSquad.cocokyu.domain.card.Card;
import org.springframework.data.repository.CrudRepository;

public interface CardRepository extends CrudRepository<Card, Long> {
}

