import { useState, useEffect } from 'react';
import todoListService from '../service/todoListService.js';
import { delay } from '../util/util';

const useData = (setTodoColumns) => {
  const [loading, setLoading] = useState(false);
  const getInitTodoData = async () => {
    setLoading(true);
    await delay(500);
    const todoListData = await todoListService.getTodoList();
    setTodoColumns(todoListData.todoData);
    setLoading(false);
  };

  useEffect(() => {
    getInitTodoData();
  }, []);

  return [loading];
};

export default useData;
