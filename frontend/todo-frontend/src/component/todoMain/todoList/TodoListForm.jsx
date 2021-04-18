import React, { useRef, useState } from 'react';
import Input from '../../atom/Input.jsx';
import { TodoCardBtnWrapper, TodoCard } from './TodoItem';
import { ConfirmBtn, CancelBtn } from '../../atom/Button.jsx';

const TodoListForm = ({ addTodoItem, toggleForm }) => {
  const [isDisabled, setIsDisabled] = useState(true);
  const inputTitleRef = useRef();
  const inputContentRef = useRef();

  const onSubmitForm = (e) => {
    e.preventDefault();
    const cardId = Date.now();
    const newTodo = {
      id: cardId,
      title: inputTitleRef.current.value,
      content: inputContentRef.current.value,
      date: Date.now(),
    };
    addTodoItem(newTodo.id, newTodo);
    toggleForm();
  };

  const foldForm = (e) => {
    e.preventDefault();
    toggleForm();
  };

  const handleChange = () => {
    if (inputTitleRef.current.value || inputContentRef.current.value) setIsDisabled(false);
    else setIsDisabled(true);
  };

  return (
    <form onSubmit={onSubmitForm} addTodoItem={addTodoItem} toggleForm={toggleForm}>
      <TodoCard flexDir='column'>
        <Input
          name='title'
          type='text'
          defaultValue=''
          placeholder='제목을 입력하세요'
          handleChange={handleChange}
          inputRef={inputTitleRef}
        />
        <Input
          name='content'
          type='text'
          defaultValue=''
          placeholder='내용을 입력하세요'
          handleChange={handleChange}
          inputRef={inputContentRef}
        />
        <TodoCardBtnWrapper>
          <ConfirmBtn value='등록' type='submit' disabled={isDisabled} />
          <CancelBtn value='취소' handleClick={foldForm} />
        </TodoCardBtnWrapper>
      </TodoCard>
    </form>
  );
};

export default TodoListForm;
