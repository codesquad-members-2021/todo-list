import { useState } from 'react';
import todoListService from '../service/todoListService';

const useTodoHook = (setTodos) => {
  const [loading, setLoading] = useState(false);

  const postTodos = async (columnId, cardId, todoCard) => {
    setLoading(true);
    await todoListService.postTodoList(columnId, { [cardId]: todoCard });
    setTodos((todos) => ({ [cardId]: todoCard, ...todos }));
    setLoading(false);
  };
  const deleteTodos = async (columnId, cardId) => {
    setLoading(true);
    await todoListService.deleteTodoList(columnId, cardId);
    setTodos((todos) => {
      delete todos[cardId];
      return { ...todos };
    });
    setLoading(false);
  };
  const putTodos = async (columnId, cardId, todoCard) => {
    setLoading(true);
    await todoListService.updateTodoList(columnId, { [cardId]: todoCard });
    setTodos((todos) => ({ ...todos, [cardId]: todoCard }));
    setLoading(false);
  };

  return [loading, postTodos, deleteTodos, putTodos];
};

export default useTodoHook;
