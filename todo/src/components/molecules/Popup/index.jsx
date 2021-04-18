import React from "react";
import styled from "styled-components";
import ButtonList from "../../atoms/Buttons/ButtonList";
import Span from "../../atoms/Span";

const WrapDiv = styled.div`
  position: absolute;
  width: 308px;
  padding: 16px;
  margin: 300px 414px;
  background: #fff6d3;
  /* right: ${(props) => (props.isPop ? 3 : -480)}px; */
  border: 2px solid #000000;
  border-radius: 5px;
  text-align: center;
  display: ${(props) => props.display};
  z-index: 10;
`;

const Popup = ({
  isPop,
  setPopup,
  setTodos,
  idState,
  setIdState,
  colState,
  setColState,
  setHistories
}) => {
  return (
    <WrapDiv display={isPop}>
      <Span _fontSize="20px" _fontWeight="700" _margin="20px">
        📌선택한 Todo 삭제할까요?
      </Span>
      <ButtonList
        isIcon={"popup"}
        {...{ setPopup, setTodos, idState, setIdState, colState, setColState, setHistories }}
      ></ButtonList>
    </WrapDiv>
  );
};

export default Popup;
