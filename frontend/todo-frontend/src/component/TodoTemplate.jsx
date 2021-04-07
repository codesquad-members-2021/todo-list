import React from 'react';
import TodoHeader from './todoHeader/TodoHeader.jsx';
import TodoMain from './todoMain/TodoMain.jsx';

const TodoTemplate = (props) => {
  return (
    <>
      <TodoHeader />
      <TodoMain />
    </>
  );
};

export default TodoTemplate;
