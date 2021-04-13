package com.example.todolist.dto;

import java.util.List;

public class CategoryDto {

    private List<CardDto> todo;
    private List<CardDto> doing;
    private List<CardDto> done;

    public CategoryDto(List<CardDto> todo, List<CardDto> doing, List<CardDto> done) {
        this.todo = todo;
        this.doing = doing;
        this.done = done;
    }

    public List<CardDto> getTodo() {
        return todo;
    }

    public List<CardDto> getDoing() {
        return doing;
    }

    public List<CardDto> getDone() {
        return done;
    }

    @Override
    public String toString() {
        return "CategoryDto{" +
                "todo=" + todo +
                ", doing=" + doing +
                ", done=" + done +
                '}';
    }
}
