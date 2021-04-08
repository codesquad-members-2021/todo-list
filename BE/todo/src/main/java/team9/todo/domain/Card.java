
package team9.todo.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.data.annotation.Id;

public class Card {
    @Id
    private int id;

    @JsonProperty
    private int owner;

    @JsonProperty
    private String title;

    @JsonProperty
    private String content;

    @JsonProperty
    private double priority;

    @JsonProperty
    private int column;

    @JsonProperty
    private int deleted;


    public Card(int owner, String title, String content, double priority, int column, int deleted) {
        this.owner = owner;
        this.title = title;
        this.content = content;
        this.priority = priority;
        this.column = column;
        this.deleted = deleted;
    }
}
