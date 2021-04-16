import React, { useRef, useState } from "react";
import useToggle from "../../../hooks/useToggle";
import SmallButton from "../../atoms/Buttons/SmallButton";
import Image from "../../atoms/Image";
import Span from "../../atoms/Span";
import closeButton from "../../../images/closeButton.svg";
import styled from "styled-components";
import axios from "axios";
import { getFormatDate } from '../../../serviceUtils/dateUtil';

const Div = styled.div`
  position: relative;
  width: 308px;
  padding: 16px;
  margin: 16px;
  background: #fff;
  border: 2px solid #000;
  border-radius: 5px;
  cursor: pointer;
`;
const TodoListItem = ({
  setTodos,
  columnId,
  id,
  title,
  content,
  author,
  setPopup,
  setIdState,
  setColState,
  setHistories,
  dragged
}) => {
  const ToItem = useRef();
  const displayPopup = () => {
    setPopup("block");
    setIdState(id);
    setColState(columnId);
  };

  const onDragStart = (e) => {
    dragged.current = e.target;
    dragged.columnId = columnId;
    dragged.title = title;
    dragged.current.style.opacity = "0.5";
  }

  const onDrop = async (e) => {
    const column = e.target.closest('._column');
    const items = column.children;
    let index;
    let placeholder;
    for (let i = 0; i < items.length; i++) {
      if (items[i].className === 'placeholder') {
        placeholder = items[i];
        index = i;
      };
    }

    dragged.current.style.opacity = "1";
    if (!placeholder) return;

    const response = await axios.post('/todos/move', {
      prevColumnId: dragged.columnId,
      currentColumnId: columnId,
      id: dragged.current.dataset.id,
      index,
    })

    const newHistory = {
      action: '이동',
      prevColumnId: dragged.columnId,
      currentColumnId: columnId,
      prevTitle: dragged.title,
      user: "Beemo",
      date: getFormatDate()
    };

    const responseHistory = await axios.post("/logs", newHistory);
    setHistories(() => responseHistory.data);

    placeholder.remove();
    setTodos(() => response.data);
  }

  return (
    <Div hover ref={ToItem} draggable={true} data-id={id}
      onDragStart={onDragStart} onDrop={onDrop} onDragOver={(e) => e.preventDefault()}>
      {/* <Popup {...{ isOpenPop, isOpenPopActions }}></Popup> */}
      <SmallButton
        _position="absolute"
        _right="3px"
        // onClick={isOpenPopActions.toggle}
        // onClick={() => {
        //   deleteClickHandler();
        // }}
        onClick={displayPopup}
        onMouseOver={() => (
          (ToItem.current.style.backgroundColor = "#ffe7ef"),
          (ToItem.current.style.border = "2px solid #f20553")
        )}
        onMouseOut={() => (
          (ToItem.current.style.backgroundColor = "white"),
          (ToItem.current.style.border = "2px solid #000")
        )}
      >
        <Image src={closeButton} _width="10px" />
      </SmallButton>
      <Span _display="block" _color="#000" _fontSize="17px" _fontWeight="700">
        {title}
      </Span>
      <Span _display="block" _color="#000" _fontSize="16px">
        {content}
      </Span>
      <Span _display="block" _color="#969595" _fontSize="13px">
        {author}
      </Span>
    </Div>
  );
};

export default TodoListItem;
