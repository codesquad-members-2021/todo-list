package com.codesquad.todoList.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@Table(value = "PROJECT")
public class Project {

    @Id
    private Long id;

    private String name;

    private List<Columns> columns = new ArrayList<>();

    public void addColumn(Columns column) {
        columns.add(column);
    }

    public void deleteColumn(Columns column) {
        columns.remove(column);
    }

}
