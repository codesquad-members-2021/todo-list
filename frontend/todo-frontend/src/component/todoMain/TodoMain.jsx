import React, { useState, useEffect } from 'react';
import TodoList from './todoList/TodoList';
import styled from 'styled-components';
import todoListService from '../../service/todoListService.js';
import useData from '../../hook/dataHook.js';

const StyledTodoMain = styled.div`
  display: flex;
  padding: 0 80px;
`;

export const LoadingPage = styled.div`
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  background-color: rgba(0, 0, 0, 0.5);
`;

const TodoMain = ({ postLogs }) => {
  const [todoColumns, setTodoColumns] = useState({});
  const [loading] = useData(setTodoColumns);
  const [dragEl, setDragEl] = useState(null);
  const [isDragging, setIsDrgging] = useState(false);
  const [dropElement, setDropElement] = useState(null);

  const deleteTodoColumn = (id) => {
    setTodoColumns((todoColumns) => {
      delete todoColumns[id];
      return { ...todoColumns };
    });
  };

  const todoColumneList = Object.values(todoColumns).map((data) => (
    <TodoList
      key={data.id}
      data={data}
      deleteTodoColumn={deleteTodoColumn}
      postLogs={postLogs}
      todoColumns={todoColumns}
      setTodoColumns={setTodoColumns}
      dragEl={dragEl}
      setDragEl={setDragEl}
      isDragging={isDragging}
      setIsDrgging={setIsDrgging}
      dropElement={dropElement}
      setDropElement={setDropElement}
    />
  ));

  return (
    <>
      {loading && <LoadingPage>loading...</LoadingPage>}
      <StyledTodoMain>{todoColumneList}</StyledTodoMain>;
    </>
  );
};
export default TodoMain;
