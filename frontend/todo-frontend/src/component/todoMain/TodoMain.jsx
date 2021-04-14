import React, { useState, useEffect } from 'react';
import TodoList from './todoList/TodoList';
import styled from 'styled-components';
import todoListService from '../../service/todoListService.js';

const StyledTodoMain = styled.div`
  display: flex;
  padding: 0 80px;
`;

const TodoMain = ({ postLogs }) => {
  const [todoColumns, setTodoColumns] = useState({});

  const getInitTodoData = async () => {
    const todoListData = await todoListService.getTodoList();
    setTodoColumns(todoListData.todoData);
  };

  useEffect(() => {
    getInitTodoData();
  }, []);

  const deleteTodoColumn = (id) => {
    setTodoColumns((todoColumns) => {
      delete todoColumns[id];
      return { ...todoColumns };
    });
  };

  const todoColumneList = Object.values(todoColumns).map((data) => (
    <TodoList data={data} deleteTodoColumn={deleteTodoColumn} postLogs={postLogs} />
  ));

  return <StyledTodoMain>{todoColumneList}</StyledTodoMain>;
};
export default TodoMain;
