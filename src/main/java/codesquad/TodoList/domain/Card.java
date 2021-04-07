package codesquad.TodoList.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDateTime;

@Entity
public class Card {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonProperty
    private Long id;

    @JsonProperty
    private String title;

    @JsonProperty
    private String contents;

    @JsonProperty
    private LocalDateTime createDate;

    private boolean toDo;
    private boolean doing;
    private boolean done;

}
