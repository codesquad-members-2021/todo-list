import React, { useState } from 'react';
import TodoItem from './TodoItem';
import TodoListForm from './TodoListForm';
import style from './todoList.module.css';
import DeleteBtn from '../../atom/DeleteBtn.jsx';

const TodoList = ({ data: { id, title, todoCards }, deleteTodoColumn }) => {
  const [todos, setTodos] = useState(todoCards);
  const [formSelected, setFormSelected] = useState(false);
  //수정완료
  const addTodoItem = (cardId, todoCard) => {
    setTodos((todos) => ({ ...todos, [cardId]: todoCard }));
  };

  //수정완료
  const deleteTodoItem = (id) => {
    setTodos((todos) => {
      delete todos[id];
      return { ...todos };
    });
  };
  //수정완료
  const editTodoItem = (id, newTodo) => {
    setTodos((todos) => ({ ...todos, [id]: newTodo }));
  };
  //수정완료
  const todoCardList = Object.values(todos).map((card) => (
    <TodoItem todoCard={card} deleteTodoItem={deleteTodoItem} editTodoItem={editTodoItem} />
  ));

  const toggleForm = () => {
    setFormSelected((formSelected) => !formSelected);
  };

  return (
    <div>
      <div>
        <span>{title}</span>
        <span>{Object.values(todos).length}개</span>
        <button onClick={toggleForm}>➕</button>
        <DeleteBtn deleteFn={() => deleteTodoColumn(id)} />
      </div>

      {formSelected ? <TodoListForm addTodoItem={addTodoItem} toggleForm={toggleForm} /> : <></>}
      <div>{todoCardList}</div>
    </div>
  );
};

export default TodoList;
