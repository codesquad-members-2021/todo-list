package com.codeSquad.cocokyu.domain.model;

import org.springframework.data.relational.core.mapping.MappedCollection;

import java.util.HashSet;
import java.util.Set;

public class Logs {
    //id 면 null
    @MappedCollection(idColumn = "card_id")
    private Set<Log> logs = new HashSet<>();

    public void createLog(Card card) {
        logs.add(new Log(card, Log.Action.CREATE));
    }

    public void updateLog(Card card, Card updateCard) {
        logs.add(new Log(card, updateCard.getStatus(), Log.Action.MOVE));
    }

    public void deleteLog(Card card) {
        logs.add(new Log(card, Log.Action.DELETED));
    }

    public Set<Log> getLogs() {
        return logs;
    }
}
