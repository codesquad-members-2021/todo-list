import React, { useState } from "react";
import TodoList from "./todoList/TodoList";
import styled from "styled-components";

const StyledTodoMain = styled.div`
  display: flex;
  padding: 0 80px;
`;

const TodoMain = ({ datas }) => {
  const [todoColumns, setTodoColumns] = useState(datas.todoData);

  const deleteTodoColumn = (id) => {
    setTodoColumns((todoColumns) => {
      delete todoColumns[id];
      return { ...todoColumns };
    });
  };

  const todoColumneList = Object.values(todoColumns).map((data) => (
    <TodoList data={data} deleteTodoColumn={deleteTodoColumn} />
  ));

  return <StyledTodoMain>{todoColumneList}</StyledTodoMain>;
};
export default TodoMain;
