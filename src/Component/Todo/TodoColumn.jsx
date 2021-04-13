import React from "react";
import styled from "styled-components";
import CreateTodo from "./CreateTodo";
import TodoColumnHead from "./TodoColumnHead";

const TodoColumnBlock = styled.div`
`;

const TodoColumn = ({title, todoItems}) => {
  return (
    <TodoColumnBlock>
      <TodoColumnHead title={title}></TodoColumnHead>
      <CreateTodo></CreateTodo>
      <div>
        {/* todoItems */}
      </div>
    </TodoColumnBlock>
  )
}

export default TodoColumn;