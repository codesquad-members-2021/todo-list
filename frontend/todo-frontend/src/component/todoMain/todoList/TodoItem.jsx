import React, { useRef, useState } from 'react';
import DeleteBtn from '../../atom/DeleteBtn.jsx';
import styled from 'styled-components';
import Input from '../../atom/Input.jsx';
import { ConfirmBtn, CancelBtn } from '../../atom/Button.jsx';

export const TodoCard = styled.div`
  display: flex;
  flex-direction: ${(props) => (props.flexDir === 'column' ? 'column' : 'row')};
  align-items: flex-start;
  padding: 16px;
  width: 288px;
  min-height: 108px;
  background-color: #ffffff;
  margin-bottom: 20px;
  justify-content: space-between;
  border-radius: 6px;
  box-shadow: 0px 1px 30px rgba(224, 224, 224, 0.3);
  &.dragging {
    opacity: 0.5;
    border: 1px dotted blue;
  }
`;

const DropLocation = styled.div`
  height: 3px;
  width: 288px;
  background-color: blue;
  opacity: 0.3;
  margin-bottom: 10px;
`;
export const TodoCardBtnWrapper = styled.div`
  display: flex;
  justify-content: space-between;
  width: 100%;
`;

export const TodoCardTitle = styled.div`
  font-weight: 700;
  margin-bottom: 10px;
`;

const TodoCardContent = styled.div`
  font-size: 0.8rem;
`;

const TodoItem = ({
  columnId,
  todoCard,
  todoCard: { id, title, content },
  deleteTodoItem,
  editTodoItem,
  setDragEl,
  setIsDrgging,
  setDragStyle,
  setDropStyle,
}) => {
  const [isEditing, setIsEditing] = useState(false);
  const [inputTitle, setInputTitle] = useState(title);
  const [inputContent, setInputContent] = useState(content);
  const [isDisabled, setIsDisabled] = useState(false);
  const [dragLeave, setDragLeave] = useState(false);
  const inputTitleRef = useRef();
  const inputContentRef = useRef();

  const toggleEditForm = () => {
    setInputTitle(title);
    setInputContent(content);
    setIsEditing((isEditing) => !isEditing);
  };

  const editItem = () => {
    const newTodo = {
      id,
      title: inputTitleRef.current.value,
      content: inputContentRef.current.value,
      date: Date.now(),
    };
    editTodoItem(id, newTodo);
    toggleEditForm();
  };

  const handleChange = () => {
    if (inputTitleRef.current.value || inputContentRef.current.value) setIsDisabled(false);
    else setIsDisabled(true);
  };

  const handleDragOver = (e) => {
    e.preventDefault();
  };

  const handleDragStart = (e) => {
    setIsDrgging(true);
    setDragEl({ beforeColumnId: columnId, ...todoCard });
    e.dataTransfer.setData('cardData', JSON.stringify({ beforeColumnId: columnId, ...todoCard }));
  };

  const handleDragLeave = (e) => {
    e.preventDefault();
  };

  if (isEditing) {
    return (
      <TodoCard flexDir='column'>
        <Input
          defaultValue={inputTitle}
          placeholder='제목을 입력하세요'
          name='title'
          handleChange={handleChange}
          inputRef={inputTitleRef}
        ></Input>
        <Input
          defaultValue={inputContent}
          placeholder='내용을 입력하세요'
          name='content'
          handleChange={handleChange}
          inputRef={inputContentRef}
        ></Input>

        <TodoCardBtnWrapper>
          <ConfirmBtn value='수정' handleClick={editItem} disabled={isDisabled} />
          <CancelBtn value='취소' handleClick={toggleEditForm} />
        </TodoCardBtnWrapper>
      </TodoCard>
    );
  } else {
    return (
      <div id={todoCard.id}>
        {setDropStyle(columnId, id) && <DropLocation></DropLocation>}
        <TodoCard
          draggable='true'
          onDoubleClick={toggleEditForm}
          flexDir='row'
          onDragOver={handleDragOver}
          onDragStart={handleDragStart}
          onDragLeave={handleDragLeave}
          className={setDragStyle(id) && 'dragging'}
        >
          <div>
            <TodoCardTitle>{title}</TodoCardTitle>
            <TodoCardContent>{content}</TodoCardContent>
          </div>
          <DeleteBtn deleteFn={() => deleteTodoItem(id)} />
        </TodoCard>
      </div>
    );
  }
};
export default TodoItem;
