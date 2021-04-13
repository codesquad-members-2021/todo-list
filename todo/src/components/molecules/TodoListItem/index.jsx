import React from "react";
import SmallButton from "../../atoms/Buttons/SmallButton";
import Image from "../../atoms/Image";
import Span from "../../atoms/Span";
import closeButton from "../../../images/closeButton.svg";

const TodoListItem = ({ title, content, author }) => {
  return (
    <>
      <SmallButton _position="absolute" _right="3px">
        <Image src={closeButton} _width="10px" />
      </SmallButton>
      <Span _display="block" _color="#000" _fontSize="17px" _fontWeight="700">{title}</Span>
      <Span _display="block" _color="#000" _fontSize="16px">{content}</Span>
      <Span _display="block" _color="#969595" _fontSize="13px">{author}</Span>
    </>
  );
};

export default TodoListItem;