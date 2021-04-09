import React, {useState, useEffect } from 'react';
import TodoColumnContainer from '../TodoColumn/TodoColumnContainer.js';

const TodoColumnListContainer = ({ handleChangeTodo }) => {
  const [columns, setColumns] = useState(['schedule', 'progress', 'complete']);
  

  useEffect(() => {
    // 서버로부터 컬럼 정보를 받는다. => setColumns 변환
    console.log("TodoColumnListContainer");
  }, []);
  
  return (
    <div>
      {columns.map((colName, i) => {
        return <TodoColumnContainer state={colName} key={`${colName}-${i}`} />;
      })}      
    </div>
  )
}

export default TodoColumnListContainer;