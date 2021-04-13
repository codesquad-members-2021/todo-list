package com.example.todolist.dto;


import java.util.ArrayList;
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

    public void setTodo(List<CardDto> todo) {
        this.todo = todo;
    }

    public List<CardDto> getDoing() {
        return doing;
    }

    public void setDoing(List<CardDto> doing) {
        this.doing = doing;
    }

    public List<CardDto> getDone() {
        return done;
    }

    public void setDone(List<CardDto> done) {
        this.done = done;
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
