import React, { useState } from 'react'
import { State } from './const.js';
import TodoCardPresentational from './TodoCardPresentational.js';

function TodoCardContainer() {
  const [state, setState] = useState(State.NORMAL);

  const onClick = () => {
    
  }

  return (
    <TodoCardPresentational onClick={onClick} state={state}/>
  )
}

export default TodoCardContainer;
