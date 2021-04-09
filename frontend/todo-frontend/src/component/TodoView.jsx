import React, { useState } from 'react';
import TodoHeader from './todoHeader/TodoHeader.jsx';
import TodoMain from './todoMain/TodoMain.jsx';

const datas = {
  author: 'kyle',
  todoData: {
    0: {
      id: 0,
      title: '해야할 일',
      todoCards: {
        123213: { id: 123213, title: 'test1', content: 'hello1' },
        123321: { id: 123321, title: 'test2', content: 'hello2' },
        123123: { id: 123123, title: 'test3', content: 'hello3' },
      },
    },
    1: {
      id: 1,
      title: '하고있는 일',
      todoCards: {
        456456: { id: 456456, title: 'test1', content: 'hello1' },
        456654: { id: 456654, title: 'test2', content: 'hello2' },
        456546: { id: 456546, title: 'test3', content: 'hello3' },
      },
    },
    2: {
      id: 2,
      title: '끝난 일',
      todoCards: {
        789789: { id: 789789, title: 'test1', content: 'hello1' },
        789987: { id: 789987, title: 'test2', content: 'hello2' },
        789879: { id: 789879, title: 'test3', content: 'hello3' },
      },
    },
  },
};

const TodoTemplate = () => {
  return (
    <>
      <TodoMain datas={datas} />
    </>
  );
};

export default TodoTemplate;
