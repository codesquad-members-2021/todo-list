import React from "react";
import styled from "styled-components";
import ButtonList from "../../atoms/Buttons/ButtonList";
import Span from "../../atoms/Span";

const Div = styled.div`
  position: relative;
  width: 308px;
  padding: 16px;
  margin: 16px;
  background: #fff;
  border: 2px solid #000;
  border-radius: 5px;
  cursor: pointer;
  text-align: center;
`;

const Popup = (props) => {
  const { conClose } = props;

  return (
    <Div>
      <Span _fontSize="20px" _fontWeight="700" _margin="20px">
        선택한 카드를 삭제할까요?
      </Span>
      <ButtonList isIcon={false}></ButtonList>
    </Div>
  );
};

export default Popup;
