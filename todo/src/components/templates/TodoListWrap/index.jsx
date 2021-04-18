import React, { useState, useEffect, memo } from "react";
import TodoListColumn from "../../organisms/TodoListColumn";
import styled from "styled-components";
import loadItems from '../../../serviceUtils/loadItems';

const Wrap = styled.div`
  display: flex;
  border: 3px solid #000;
  width: max-content;
  margin: 0 0px 10px 5px;
  background: #d9ffea;
  border-radius: 10px;
`;

const TodoListWrap = ({ setHistories }) => {
  const [todos, setTodos] = useState([]);

  useEffect(() => {
    loadItems(setTodos, "/todos");
  }, [])

  return (
    <Wrap>
      {todos.map(({ columnId, columnName, items }) => {
        return (
          <TodoListColumn key={columnId} {...{ setTodos, columnId, columnName, items, setHistories }} />
        );
      })}
    </Wrap>
  );
};

export default memo(TodoListWrap);
