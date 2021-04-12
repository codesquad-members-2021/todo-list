import React from "react";
import TodoListColumn from "../../organisms/TodoListColumn";
import styled from "styled-components";

const Wrap = styled.div`
  display: flex;
  justify-content: space-between;
  width: 1110px;
`;

const TodoContent = ({ todos }) => {
  return (
    <Wrap>
      {todos.map(({ columnId, columnName, items }) => {
        return (<TodoListColumn key={columnId} {...{ columnName, items }} />);
      })}
    </Wrap>
  );
};

export default TodoContent;
