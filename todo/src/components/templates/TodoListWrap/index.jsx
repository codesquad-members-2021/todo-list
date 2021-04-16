import React, { useState, useEffect, memo, useRef } from "react";
import TodoListColumn from "../../organisms/TodoListColumn";
import styled from "styled-components";
import loadItems from "../../../serviceUtils/loadItems";
import Popup from "../../molecules/Popup";
import TodoListItem from '../../molecules/TodoListItem';

function insertAfter(referenceNode, newNode) {
  if (!!referenceNode.nextSibling) {
    referenceNode.parentNode.insertBefore(newNode, referenceNode.nextSibling);
  } else {
    referenceNode.parentNode.appendChild(newNode);
  }
}

const Wrap = styled.div`
  display: flex;
  border: 3px solid #000;
  width: max-content;
  margin: 0 0px 10px 5px;
  background: #d9ffea;
  border-radius: 10px;
`;


const TodoListWrap = ({ setHistories }) => {
  const [todos, setTodos] = useState([]);
  const [isPop, setPopup] = useState("none");
  const [idState, setIdState] = useState();
  const [colState, setColState] = useState();

  const placeholder = document.createElement("div");
  placeholder.className = "placeholder";
  const dragged = { current: null, columnId: null };

  const titleRef = useRef(null);

  const onDragOver = (e) => {
    const { target } = e;


    if (dragged.current.contains(target)) return;
    if (target.closest('.placeholder')) return;
    if (target.closest('.item_wrap')) {
      if (target.parentNode.className === 'item_wrap') {
        insertAfter(target.parentNode, placeholder);
        return;
      } else if (target.parentNode.parentNode.className === 'item_wrap') {
        insertAfter(target.parentNode.parentNode, placeholder);
        return;
      } else if (target.parentNode.parentNode.parentNode.className === 'item_wrap') {
        insertAfter(target.parentNode.parentNode.parentNode, placeholder);
        return;
      }
      insertAfter(target, placeholder);
    }
    if (target.className === titleRef.current.className) {
      if (target.tagName !== 'DIV') return;
      insertAfter(target, placeholder);
    }
  }

  useEffect(() => {
    loadItems(setTodos, "/todos");
  }, []);

  return (
    <Wrap onDragOver={onDragOver}  >
      <Popup
        {...{
          isPop,
          setPopup,
          setTodos,
          idState,
          setIdState,
          colState,
          setColState,
        }}
      ></Popup>
      {todos.map(({ columnId, columnName, items }) => {
        return (
          <TodoListColumn
            key={columnId}
            {...{
              setTodos,
              columnId,
              columnName,
              items,
              setHistories,
              setPopup,
              setIdState,
              setColState,
              dragged,
              titleRef
            }}
          />
        );
      })}
    </Wrap>
  );
};

export default memo(TodoListWrap);
