import { useState } from 'react';
import todoListService from '../service/todoListService';

const useTodoHook = (setTodos, setTodoColumns) => {
  const [loading, setLoading] = useState(false);

  const postTodos = async (columnId, cardId, todoCard) => {
    setLoading(true);
    await todoListService.postTodoList(columnId, { [cardId]: todoCard });
    setTodos((todos) => ({ [cardId]: todoCard, ...todos }));
    setTodoColumns(JSON.parse(localStorage.getItem('todos')).todoData);
    setLoading(false);
  };
  const deleteTodos = async (columnId, cardId) => {
    setLoading(true);
    await todoListService.deleteTodoList(columnId, cardId);
    setTodoColumns(JSON.parse(localStorage.getItem('todos')).todoData);
    setTodos((todos) => {
      delete todos[cardId];
      return { ...todos };
    });
    setLoading(false);
  };
  const putTodos = async (columnId, cardId, todoCard) => {
    setLoading(true);
    await todoListService.updateTodoList(columnId, { [cardId]: todoCard });
    setTodoColumns(JSON.parse(localStorage.getItem('todos')).todoData);
    setTodos((todos) => ({ ...todos, [cardId]: todoCard }));
    setLoading(false);
  };

  const moveTodos = async ({ columnId, selectDragObj, afterElement }) => {
    setLoading(true);
    let movedCardList = await getTodoCardList({ columnId, selectDragObj, afterElement });
    setTodoCardList({ columnId, selectDragObj, afterElement });
    await todoListService.moveTodoList({ columnId, selectDragObj, movedCardList });
    setLoading(false);
  };
  //이동시킨 cardList에 맞게 todoColumns set
  const setTodoCardList = ({ columnId, selectDragObj, afterElement }) => {
    const { beforeColumnId, ...cardData } = selectDragObj;
    setTodoColumns((todoColumns) => {
      const originCardList = todoColumns[columnId].todoCards;
      delete todoColumns[beforeColumnId].todoCards[cardData.id];
      const newCardList = afterElement
        ? getMovedCardList(originCardList, afterElement.id, cardData)
        : { ...originCardList, [cardData.id]: cardData };
      todoColumns[columnId].todoCards = { ...newCardList };
      return { ...todoColumns };
    });
  };
  const getTodoCardList = async ({ columnId, selectDragObj, afterElement }) => {
    const { beforeColumnId, ...cardData } = selectDragObj;
    const originCardList = JSON.parse(localStorage.getItem('todos')).todoData[columnId].todoCards;
    const newCardList = afterElement
      ? getMovedCardList(originCardList, afterElement.id, cardData)
      : { ...originCardList, [cardData.id]: cardData };
    return newCardList;
  };
  //이동한 cardList객체 구하는 함수
  const getMovedCardList = (cardList, cardId, data) => {
    const newCardList = {};
    for (const key in cardList) {
      if (key === cardId) newCardList[data.id] = { ...data };
      newCardList[key] = { ...cardList[key] };
    }
    return { ...newCardList };
  };

  return [loading, postTodos, deleteTodos, putTodos, moveTodos];
};

export default useTodoHook;
