import React, { useState, useEffect, useRef, useCallback } from 'react';
import TodoItem from './TodoItem';
import TodoListForm from './TodoListForm';
import DeleteBtn from '../../atom/DeleteBtn.jsx';
import styled from 'styled-components';
import useTodoHook from '../../../hook/todoHook';

const StyledTodoList = styled.div`
  width: 308px;
  margin-right: 20px;
  .todoCardList {
    width: 308px;
    min-height: 700px;
    background: #d8e3e7;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px 0;
    border-radius: 6px;
  }
`;

const TodoTitleDiv = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px;
`;

const AddButton = styled.svg`
  fill: #aaaaaa;
  &:hover {
    fill: #a4ebf3;
  }
  margin: 0 5px;
`;

const Title = styled.span`
  font-family: Noto Sans KR;
  font-style: normal;
  font-weight: bold;
  font-size: 18px;
  line-height: 26px;
`;

const CircleNumber = styled.span`
  width: 26px;
  height: 26px;
  background: #d8e3e7;
  border-radius: 20px;
  padding: 0.5rem;
  font-family: Noto Sans KR;
  font-size: 14px;
  display: flex;
  align-items: center;
  text-align: center;
  margin: 0 10px;
  float: right;
`;

const LoadingPage = styled.div`
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  background-color: rgba(0, 0, 0, 0.5);
`;

const TodoList = ({
  data: { id, title, todoCards },
  deleteTodoColumn,
  postLogs,
  todoColumns,
  setTodoColumns,
  dragEl,
  setDragEl,
  isDragging,
  setIsDrgging,
  dropElement,
  setDropElement,
}) => {
  const [todos, setTodos] = useState(todoCards);
  const [loading, postTodos, deleteTodos, putTodos, moveTodos] = useTodoHook(
    setTodos,
    setTodoColumns
  );
  const [formSelected, setFormSelected] = useState(false);
  const currentColumnDiv = useRef();

  useEffect(() => {
    setTodos(todoCards);
  }, [todoCards, setTodos]);

  const addTodoItem = async (cardId, todoCard) => {
    const { title: itemTitle, date: itemDate } = todoCard;
    postLogs({
      columnTitle: title,
      itemTitle: itemTitle,
      date: itemDate,
      action: 'add',
    });
    postTodos(id, cardId, todoCard);
  };

  const deleteTodoItem = async (cardId) => {
    const newLog = getLogData(cardId);
    postLogs({ ...newLog, action: 'delete' });
    deleteTodos(id, cardId);
  };

  const editTodoItem = async (cardId, newTodo) => {
    const newLog = getLogData(cardId);
    postLogs({
      ...newLog,
      action: 'update',
      changedTitle: newTodo.title,
    });
    putTodos(id, cardId, newTodo);
  };

  const getLogData = (cardId) => {
    const newLog = {
      columnTitle: title,
      itemTitle: todos[cardId].title,
      date: Date.now(),
    };
    return newLog;
  };

  const toggleForm = () => {
    setFormSelected((formSelected) => !formSelected);
  };

  const handledragOver = (e) => {
    e.preventDefault();
  };
  const handleDragEnter = (e) => {
    e.preventDefault();
    const afterElement = getDragAfterElement(e.clientY);
    setDropElement(afterElement);
  };

  const getDragAfterElement = (locationY) => {
    const draggableCards = [...currentColumnDiv.current.children];
    console.log(draggableCards);
    const dragAfterElement = draggableCards.reduce(
      (closestCard, child) => {
        const cardBox = child.getBoundingClientRect();
        const offset = locationY - cardBox.top - cardBox.height / 2;
        if (offset < 0 && offset > closestCard.offset) return { offset: offset, element: child };
        else return closestCard;
      },
      { offset: Number.NEGATIVE_INFINITY }
    ).element;
    return dragAfterElement;
  };

  const handleDrop = (e) => {
    e.preventDefault();
    const selectDragObj = JSON.parse(e.dataTransfer.getData('cardData'));
    const { beforeColumnId, ...cardData } = selectDragObj;
    const afterElement = getDragAfterElement(e.clientY);
    if (afterElement && +afterElement.id === cardData.id) return;
    postLogs({
      columnTitle: todoColumns[beforeColumnId].title,
      itemTitle: cardData.title,
      action: 'move',
      date: Date.now(),
      movedColumnTitle: title,
    });
    moveTodos({ columnId: id, selectDragObj, afterElement });
    setIsDrgging(false);
    setDropElement(null);
  };

  const setDragStyle = (id) => (isDragging && id === dragEl.id ? 'dragging' : '');
  const setDropStyle = (columnId, cardId) =>
    isDragging &&
    dropElement &&
    +dropElement.id === cardId &&
    dragEl.id !== cardId &&
    id === columnId;

  const todoCardList = Object.values(todos).map((card) => (
    <TodoItem
      key={card.id}
      columnId={id}
      todoCard={card}
      deleteTodoItem={deleteTodoItem}
      editTodoItem={editTodoItem}
      setDragEl={setDragEl}
      setIsDrgging={setIsDrgging}
      setDragStyle={setDragStyle}
      setDropStyle={setDropStyle}
    />
  ));

  return (
    <>
      {loading && <LoadingPage>loading...</LoadingPage>}
      <StyledTodoList>
        <TodoTitleDiv>
          <div>
            <Title>{title}</Title>
            <CircleNumber>{Object.values(todos).length}</CircleNumber>
          </div>
          <div>
            <AddButton
              onClick={toggleForm}
              width='14'
              height='14'
              viewBox='0 0 14 14'
              fill='none'
              xmlns='http://www.w3.org/2000/svg'
            >
              <path d='M0.105709 7.53033L0.105709 6.46967H6.46967V0.105713H7.53033V6.46967H13.8943V7.53033H7.53033V13.8943H6.46967V7.53033H0.105709Z' />
            </AddButton>
            <DeleteBtn deleteFn={() => deleteTodoColumn(id)} />
          </div>
        </TodoTitleDiv>

        {formSelected ? <TodoListForm addTodoItem={addTodoItem} toggleForm={toggleForm} /> : <></>}
        <div
          className='todoCardList'
          onDrop={handleDrop}
          onDragOver={handledragOver}
          onDragEnter={handleDragEnter}
          ref={currentColumnDiv}
        >
          {todoCardList}
        </div>
      </StyledTodoList>
    </>
  );
};

export default TodoList;
