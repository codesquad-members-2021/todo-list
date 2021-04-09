import React from 'react'
import TodoColumnContainer from '../Components/TodoColumn/TodoColumnContainer.js';

const MOCK_DATA = [
  {
    columnId: 'Neiscolumn1',
    title: 'Todo Column1',
  },
  {
    columnId: 'Neiscolumn2',
    title: 'Todo Column2',
  },
  {
    columnId: 'Neiscolumn3',
    title: 'Todo Column3',
  }
];

function MainPage() {
  return (
    <> 
      {MOCK_DATA.map(data => <TodoColumnContainer key={data.columnId} state={data} />)}
    </>
  )
}

export default MainPage;
