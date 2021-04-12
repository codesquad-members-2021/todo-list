import React from "react";
import SmallButton from "../../atoms/SmallButton";
import Image from "../../atoms/Image";
import Span from "../../atoms/Span";
import closeButton from "../../../images/closeButton.svg";

const TodoListItem = ({ children, ...props }) => {
  return (
    <>
      <SmallButton _position="absolute" _right="3px">
        <Image src={closeButton} _width="10px" />
      </SmallButton>
      <Span _color="#000" _fontSize="17px" _fontWeight="700">
        {children}
      </Span>
      <Span _color="#000" _fontSize="16px">
        {children}
      </Span>
      <Span _color="#969595" _fontSize="13px">
        {children}
      </Span>
    </>
  );
};

export default TodoListItem;
