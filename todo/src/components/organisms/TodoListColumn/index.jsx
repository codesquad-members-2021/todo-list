import React from "react";
import styled from "styled-components";
import TodoTitle from "../../molecules/TodoTitle";
import TodoListInput from "../../molecules/TodoListInput";
import TodoSwitch from "../../molecules/TodoSwitch";
import { useState } from 'react';

const Div = styled.div`
  margin: 5px;
`;

const TodoListColumn = ({ columnName, items }) => {

  return (
    <Div>
      <TodoTitle itemCount={items.length}>{columnName}</TodoTitle>
      {items.map(({ id, title, content, author }) => {
        return (
          <TodoSwitch key={id} {...{ id, title, content, author }}></TodoSwitch>
        );
      })}
    </Div>);
};

export default TodoListColumn;
