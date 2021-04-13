import { useState, useEffect } from "react";
import styled from "styled-components";
import TodoTitle from "../../molecules/TodoTitle";
import TodoListItem from "../../molecules/TodoListItem";
import TodoListInput from "../../molecules/TodoListInput";
const Div = styled.div`
  margin: 5px;
`;

// 해야할 일 컬럼 상단에 TodoListInput 넣기
// 1. + 버튼이 눌린 컬럼 id를 찾는다
// 2. 해당 컬럼 Items 자리 상단에 TodoListInput을 넣는다.

const showTodoListInput = () => {
  return <TodoListInput></TodoListInput>;
};
const addTodo = e => {
  e.preventDefault();
};

const TodoListColumn = ({ columnId, columnName, items }) => {
  const [newTodo, setTodos] = useState([]);

  return (
    <Div>
      <TodoTitle addTodos={addTodo}>{columnName}</TodoTitle>
      {showTodoListInput()}
      {items.map(({ id, title, content, author }) => {
        return (
          <TodoListItem key={id} {...{ title, content, author }}></TodoListItem>
        );
      })}
    </Div>
  );
};

export default TodoListColumn;
