import React, { useState, useEffect } from 'react';
import { TodoCardViewState } from './const.js';
import TodoCardPresentational from './TodoCardPresentational.js';

function TodoCardContainer(props) {
  const [viewState, setViewState] = useState(props.viewState);
  const [state, setState] = useState(props.state);

  useEffect(() => {
    // TODO
    console.log('call useEffect');
  }, [state]);

  const onDoubleClickCapture = (evt) => {
    evt.stopPropagation();
    evt.preventDefault();
    setViewState(TodoCardViewState.EDIT);

    evt.target.focus();
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
    setViewState(TodoCardViewState.NORMAL);
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
      onDoubleClickCapture={onDoubleClickCapture}
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
