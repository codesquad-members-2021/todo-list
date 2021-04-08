package com.team13.todolist.repository;

import com.team13.todolist.model.Card;
import com.team13.todolist.model.Column;
import com.team13.todolist.model.ToDoList;
import org.assertj.core.api.SoftAssertions;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.data.jdbc.DataJdbcTest;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.ListIterator;

@DataJdbcTest
class ToDoListRepositoryTest {

    private SoftAssertions softly;

    @Autowired
    private ToDoListRepository toDoListRepository;

    @BeforeEach
    public void setUp() {
        softly = new SoftAssertions();
    }

    @AfterEach
    public void afterEach() {
        softly.assertAll();
    }

    @Test
    @DisplayName("칼럼이 없는 ToDoList를 추가한다.")
    public void addToDoList() {
        ToDoList toDoList = ToDoList.of("Team13", null);
        toDoListRepository.save(toDoList);
        softly.assertThat(toDoListRepository.findAll()).hasSize(1);
    }

    @Test
    @DisplayName("칼럼 3개를 갖는 ToDoList를 추가한다.")
    public void addToDoListWithColumns() {
        List<Column> columns = Arrays.asList(
                Column.of("할 일", null),
                Column.of("해야할 일", null),
                Column.of("끝난 일", null)
        );
        ToDoList toDoList = toDoListRepository.save(ToDoList.of("Team13", columns));
        softly.assertThat(toDoListRepository.findAll()).hasSize(1);
        ToDoList myToDoList = toDoListRepository.findById(toDoList.getId())
                .orElseThrow(() -> new RuntimeException("NOT FOUND"));
        softly.assertThat(myToDoList.getColumns()).hasSize(3);
    }

    @Test
    @DisplayName("카드를 가지는 ToDoList를 추가한다.")
    public void addToDoListWithCards() {
        List<List<Card>> cardsList = new ArrayList<>();
        cardsList.add(Arrays.asList(
                Card.of("Spring 공부", "토비의 스프링 공부"),
                Card.of("AWS 공부", "호눅스의 AWS 공부")
        ));

        cardsList.add(Arrays.asList(
                Card.of("JAVA 공부", "토비의 스프링 공부")
        ));

        cardsList.add(Arrays.asList(
                Card.of("자바의 정석 공부", "자바의 정석 공부 "),
                Card.of("AWS 공부", "호눅스의 AWS 공부")
        ));

        List<Column> columns = Arrays.asList(
                Column.of("할 일", cardsList.get(0)),
                Column.of("해야할 일", cardsList.get(1)),
                Column.of("끝난 일", cardsList.get(2))
        );

        ToDoList toDoList = toDoListRepository.save(ToDoList.of("Team13", columns));
        softly.assertThat(toDoListRepository.findAll()).hasSize(1);
        ToDoList myToDoList = toDoListRepository.findById(toDoList.getId())
                .orElseThrow(() -> new RuntimeException("NOT FOUND"));
        softly.assertThat(myToDoList.getColumns()).hasSize(3);

        ListIterator<Column> columnsIterator = myToDoList.getColumns().listIterator();
        while (columnsIterator.hasNext()) {
            int index = columnsIterator.nextIndex();
            Column column = columnsIterator.next();
            softly.assertThat(column.getCards()).hasSize(cardsList.get(index).size());
        }
    }


}