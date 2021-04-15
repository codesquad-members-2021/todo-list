import React, { useState, useEffect, memo } from "react";
import TodoListColumn from "../../organisms/TodoListColumn";
import styled from "styled-components";
import loadItems from "../../../serviceUtils/loadItems";
import Popup from "../../molecules/Popup";

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
  useEffect(() => {
    loadItems(setTodos, "/todos");
  }, []);
  return (
    <Wrap>
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
            }}
          />
        );
      })}
    </Wrap>
  );
};

export default memo(TodoListWrap);
