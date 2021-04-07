import React, { useState, useEffect } from 'react';
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

  useEffect(() => {
    // TODO
    console.log('call useEffect')
  }, [state]);

  const onChangeTitle = ({ target }) => {
    setState({ ...state, title: target.value });
  }

  const onChangeContent = ({ target }) => {
    if (target.clientHeight < target.scrollHeight)
      target.style.height = `${target.scrollHeight + 4}px`;
    
    setState({ ...state, content: target.value });
  }

  const onClickCancelBtn = ({ target }) => {
    // TODO: setViewState
    console.log('click cancelBtn');
  }

  const onClickConfirmBtn = ({ target }) => {
    // TODO: setViewState
    console.log('click confirmBtn');
  }

  return (
    <TodoCardPresentational
      onChangeTitle={onChangeTitle}
      onChangeContent={onChangeContent}
      onClickCancelBtn={onClickCancelBtn}
      onClickConfirmBtn={onClickConfirmBtn}
      state={state}
      viewState={viewState}/>
  )
}

export default TodoCardContainer;
