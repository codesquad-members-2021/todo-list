import React from "react";
import SmallButton from "../../atoms/SmallButton";
import Image from "../../atoms/Image";
import Form from "../../atoms/Form";
import Span from "../../atoms/Span";
import closeButton from "../../../images/closeButton.svg";

const TodoListItem = () => {
  return (
    <Form>
      <SmallButton _position="absolute" _right="3px">
        <Image src={closeButton} _width="10px" />
      </SmallButton>
      <Span _color="#000" _fontSize="17px" _fontWeight="700"></Span>
      <Span _color="#000" _fontSize="16px"></Span>
      <Span _color="#969595" _fontSize="13px"></Span>
    </Form>
  );
};

export default TodoListItem;
