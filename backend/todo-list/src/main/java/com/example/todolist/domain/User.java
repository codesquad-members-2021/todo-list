package com.example.todolist.domain;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.MappedCollection;

import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

public class User {

    @JsonIgnore
    @Id
    private Long userId;

    private String name;

    @JsonIgnore
    private String password;

    private String profileUrl;

    @JsonIgnore
    @MappedCollection(idColumn = "user_id", keyColumn = "user_id")
    private List<Card> cards = new LinkedList<>();

    protected User() {
    }

    public User(String name, String password, String profileUrl) {
        this.name = name;
        this.password = password;
        this.profileUrl = profileUrl;
    }

    public Long getUserId() {
        return userId;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public List<Card> getCards() {
        return cards;
    }

    public String getProfileUrl() {
        return profileUrl;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(userId, user.userId) && Objects.equals(name, user.name) && Objects.equals(password, user.password) && Objects.equals(profileUrl, user.profileUrl) && Objects.equals(cards, user.cards);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, name, password, profileUrl, cards);
    }
}
