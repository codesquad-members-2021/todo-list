package com.team08.todolist.controller;

import com.team08.todolist.model.Card;
import com.team08.todolist.model.Item;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/items")
public class ApiItemController {


    @GetMapping
    public List<Item> list() {
        List<Item> items = new ArrayList<>();
        items.add(new Item(1, "ToDo", 65535, 1));
        items.add(new Item(2, "Doing", 65535 * 2, 1));
        items.add(new Item(3, "Done", 65535 * 4, 1));
        return items;
    }
}
