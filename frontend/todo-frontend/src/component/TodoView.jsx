import React from 'react';
import TodoHeader from './todoHeader/TodoHeader.jsx';
import TodoMain from './todoMain/TodoMain.jsx';
import useLogHook from '../hook/logHook.js';

const TodoTemplate = () => {
  const [logs, postLogs] = useLogHook([]);

  return (
    <>
      <TodoHeader logs={logs} />
      <TodoMain postLogs={postLogs} />
    </>
  );
};

export default TodoTemplate;
