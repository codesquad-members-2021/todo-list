import { useState, useEffect } from 'react';
import Columns from './Columns';
import styled from 'styled-components';

const TodoStore = () => {
  const [todoData, setToDoData] = useState([]);

  useEffect(() => {
    const url = 'http://localhost:3000/data.json';
    fetchTodos(url, setToDoData);
  }, []);

  const fetchTodos = async (url, callback) => {
    const response = await fetch(url);
    const data = await response.json();
    callback(data);
  };

  const changeColumns = (columns) => {
    setToDoData(columns);
  };

  const columnLists = todoData.map((data, i) => (
    <Columns
      key={data.columns[i].id}
      data={data}
      changeColumns={changeColumns}
    />
  ));

  return (
    <ToDoListWrap>
      <div className="TodoList">{columnLists}</div>
    </ToDoListWrap>
  );
};

export default TodoStore;

const ToDoListWrap = styled.div`
  .TodoList {
    margin-top: 30px;
  }
`;
