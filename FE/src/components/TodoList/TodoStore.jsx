import { useState, useEffect } from 'react';
import axios from 'axios';
import Columns from './Columns';
import styled from 'styled-components';

const TodoStore = () => {
  const [todoData, setToDoData] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const url = 'boards';
    fetchTodos(url, setToDoData);
  }, []);

  const fetchTodos = async (url, callback) => {
    const response = await axios.get(url);
    const data = response.data;
    callback(data);
    setLoading(false);
  };

  const changeColumns = (columns) => {
    setToDoData(columns);
  };

  return (
    <>
      {loading ? (
        <div>loading....</div>
      ) : (
        <ToDoListWrap>
          <div className="TodoList">
            <Columns todoData={todoData} changeColumns={changeColumns} />
          </div>
        </ToDoListWrap>
      )}
    </>
  );
};

export default TodoStore;

const ToDoListWrap = styled.div`
  .TodoList {
    margin-top: 30px;
  }
`;
