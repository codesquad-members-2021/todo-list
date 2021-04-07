import React, { useState } from 'react';
import { ViewState } from './const.js';
import TodoCardPresentational from './TodoCardPresentational.js';

function TodoCardContainer(props) {
  const [viewState, setViewState] = useState(ViewState.NORMAL);
  const [state, setState] = useState({
    title: '',
    content: '',
    createDate: null,
    updateDate: null,
    author: '',
  });

  const onChangeContent = ({ target }) => {
    if (target.clientHeight < target.scrollHeight)
      target.style.height = `${target.scrollHeight + 4}px`;
  }

  const onClickCancelBtn = ({ target }) => {
    // TODO
    console.log('click cancelBtn');
  }

  const onClickConfirmBtn = ({ target }) => {
    // TODO
    console.log('click confirmBtn');
  }

  return (
    <TodoCardPresentational
      onChangeContent={onChangeContent}
      onClickCancelBtn={onClickCancelBtn}
      onClickConfirmBtn={onClickConfirmBtn}
      viewState={viewState}/>
  )
}

export default TodoCardContainer;
