package com.team08.todolist.model;

public class Item {

    private int itemId;
    private String title;
    private int position;
    private int count;

    public Item(int itemId, String title, int position, int count) {
        this.itemId = itemId;
        this.title = title;
        this.position = position;
        this.count = count;
    }

    public int getItemId() {
        return itemId;
    }

    public String getTitle() {
        return title;
    }

    public int getPosition() {
        return position;
    }

    public int getCount() {
        return count;
    }
}
