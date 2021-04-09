import React, { useRef } from 'react';

const TodoListForm = ({ addTodoItem, toggleForm }) => {
  //수정완료
  const onSubmitForm = (e) => {
    e.preventDefault();
    const cardId = Date.now();
    const newTodo = {
      id: cardId,
      title: inputTitleRef.current.value,
      content: inputContentRef.current.value,
    };
    addTodoItem(newTodo.id, newTodo);
    inputTitleRef.current.value = '';
    inputContentRef.current.value = '';
  };
  const foldForm = (e) => {
    e.preventDefault();
    toggleForm();
  };

  const inputTitleRef = useRef(); //inputTitleRef.current.value
  const inputContentRef = useRef(); //inputContentRef.current.value

  return (
    <form onSubmit={onSubmitForm}>
      <input type='text' placeholder='제목을 입력하세요' ref={inputTitleRef} />
      <input type='text' placeholder='내용을 입력하세요' ref={inputContentRef} />
      <button type='submit'>등록</button>
      <button onClick={foldForm}>취소</button>
    </form>
  );
};

export default TodoListForm;
