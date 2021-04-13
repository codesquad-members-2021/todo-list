import React from "react";
import styled from "styled-components";
import test from "./test.json";
import TodoColumn from "./TodoColumn";

const TodoContainerBlock = styled.div`
  display: grid;
  grid-auto-flow: column;
  grid-auto-columns: 16rem;
  grid-gap: 1rem;
  box-sizing: border-box;
`;

const TodoContainer = () => {
  const TodoColumns = test.todoColumns.map((v, index) => <TodoColumn {...v} key={index}/>);
  return (
    <TodoContainerBlock>
      {TodoColumns}
    </TodoContainerBlock>
  )
}

export default TodoContainer;