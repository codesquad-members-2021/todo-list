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
    console.log('call useEffect');
  }, [state]);

  const onDoubleClick = ({ target }) => {
    console.log(target);
    setViewState(ViewState.EDIT);
    // target.focus();
  };

  const onChangeTitle = ({ target }) => {
    setState({ ...state, title: target.value });
  };

  const onChangeContent = ({ target }) => {
    if (target.clientHeight < target.scrollHeight)
      target.style.height = `${target.scrollHeight + 4}px`;

    setState({ ...state, content: target.value });
  };

  const onClickCancelBtn = ({ target }) => {
    // TODO: delete logic
    setViewState(ViewState.NORMAL);
  };

  const onClickConfirmBtn = ({ target }) => {
    // TODO: network logic
    console.log('click confirmBtn');
  };

  const onClickDeleteBtn = ({ target }) => {
    // TODO
    console.log('click deleteBtn');
  };

  return (
    <TodoCardPresentational
      onDoubleClick={onDoubleClick}
      onChangeTitle={onChangeTitle}
      onChangeContent={onChangeContent}
      onClickCancelBtn={onClickCancelBtn}
      onClickConfirmBtn={onClickConfirmBtn}
      onClickDeleteBtn={onClickDeleteBtn}
      state={state}
      viewState={viewState}
    />
  );
}

export default TodoCardContainer;
