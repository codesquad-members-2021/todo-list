package com.example.todolist.dto;

import java.util.List;

public class CategoryDTO {

    private List<CardDTO> todo;
    private List<CardDTO> doing;
    private List<CardDTO> done;

    public CategoryDTO(List<CardDTO> todo, List<CardDTO> doing, List<CardDTO> done) {
        this.todo = todo;
        this.doing = doing;
        this.done = done;
    }

    public List<CardDTO> getTodo() {
        return todo;
    }

    public List<CardDTO> getDoing() {
        return doing;
    }

    public List<CardDTO> getDone() {
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
