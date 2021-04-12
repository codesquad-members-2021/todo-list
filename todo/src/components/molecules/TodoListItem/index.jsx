import React from "react";
import SmallButton from "../../atoms/SmallButton";
import Image from "../../atoms/Image";
import Span from "../../atoms/Span";
import closeButton from "../../../images/closeButton.svg";

const TodoListItem = ({ children, title, content, author, ...props }) => {
  return (
    <>
      <SmallButton _position="absolute" _right="3px">
        <Image src={closeButton} _width="10px" />
      </SmallButton>
      <div>
        <Span _color="#000" _fontSize="17px" _fontWeight="700">{title}</Span>
      </div>
      <div>
        <Span _color="#000" _fontSize="16px">{content}</Span>
      </div>
      <div>
        <Span _color="#969595" _fontSize="13px">{author}</Span>
      </div>
    </>
  );
};

export default TodoListItem;
