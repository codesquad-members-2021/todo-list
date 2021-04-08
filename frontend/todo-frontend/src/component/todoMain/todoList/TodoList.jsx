import React, { useState, useCallback } from "react";
import TodoItem from "./TodoItem";
import TodoListForm from "./TodoListForm";

const TodoList = ({ data: { id, title, todoCards } }) => {
  const [todos, setTodos] = useState(todoCards);

  const addTodoItem = (todoCard) => {
    setTodos((todos) => [...todos, todoCard]);
  };

  const deleteTodoItem = (id) => {
    setTodos((todos) => todos.filter((todo) => todo.id !== id));
  };

  const todoCardList = todos.map((card) => (
    <TodoItem todoCard={card} deleteTodoItem={deleteTodoItem} />
  ));
  return (
    <div>
      <div>
        {title} {todos.length}개
      </div>

      <TodoListForm addTodoItem={addTodoItem} />
      <div>{todoCardList}</div>
    </div>
  );
};

export default TodoList;
