import React from "react";
import styled from "styled-components";
import TodoTitle from "../../molecules/TodoTitle";
import TodoListItem from "../../molecules/TodoListItem";

const Div = styled.div`
  margin: 5px;
`;

const TodoListColumn = ({ columnName, items }) => {
  return (
    <Div>
      <TodoTitle>{columnName}</TodoTitle>
      {items.map(({ id, title, content, author }) => {
        return (
          <TodoListItem key={id} {...{ title, content, author }}></TodoListItem>
        );
      })}
    </Div>);
};

export default TodoListColumn;
