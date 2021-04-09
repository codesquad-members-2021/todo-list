import React, {useState, useEffect } from 'react';
import styled from 'styled-components';

import TodoColumnContainer from '../TodoColumn/TodoColumnContainer.js';

const TodoColumnListContainer = ({ handleChangeTodo }) => {
  const [columns, setColumns] = useState([
    {title: 'schedule'},{title: 'progress'},{title: 'complete'}
  ]);
  

  useEffect(() => {
    // 서버로부터 컬럼 정보를 받는다. => setColumns 변환
  }, []);
  
  return (
    <TodoColumnContainerLayout>
      {columns.map((colName, i) => {
        return <TodoColumnContainer state={colName} key={`${colName}-${i}`} />;
      })}      
    </TodoColumnContainerLayout>
  )
}

const TodoColumnContainerLayout = styled.div`
  display: flex;
`

export default TodoColumnListContainer;