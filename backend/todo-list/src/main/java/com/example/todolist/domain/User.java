package com.example.todolist.domain;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.Id;
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
    private String token;

    @JsonIgnore
    @MappedCollection(idColumn = "user_id", keyColumn = "user_id")
    private List<Card> cards = new LinkedList<>();

    public User() {
    }

    public User(String name, String password, String profileUrl, String token) {
        this.name = name;
        this.password = password;
        this.profileUrl = profileUrl;
        this.token = token;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public List<Card> getCards() {
        return cards;
    }

    public void setCards(List<Card> cards) {
        this.cards = cards;
    }

    public String getProfileUrl() {
        return profileUrl;
    }

    public void setProfileUrl(String profileUrl) {
        this.profileUrl = profileUrl;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(userId, user.userId) && Objects.equals(name, user.name) && Objects.equals(password, user.password) && Objects.equals(token, user.token) && Objects.equals(cards, user.cards);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, name, password, token, cards);
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", token='" + token + '\'' +
                ", cards=" + cards +
                '}';
    }
}
