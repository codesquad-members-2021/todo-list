import React from "react";
import styled from "styled-components";
import SmallButton from "../../atoms/SmallButton";
import Image from "../../atoms/Image";
import Form from "../../atoms/Form";
import Span from "../../atoms/Span";
import CancelBtn from "../../../images/cancelButton.svg";

const TodoListItem = () => {
  return (
    <Form
      _width="300px"
      _backgroundColor="#fff"
      _position="relative"
      _borderRadius="5px"
      _margin="15px"
    >
      <SmallButton _position="absolute" _right="3px">
        <Image src={CancelBtn} imgWidth="10px" />
      </SmallButton>
      <Span
        _fontSize="17px"
        _color="#000"
        _fontWeight="700"
        _display="block"
        _padding="5px"
      >
        GitHub 공부하기
      </Span>
      <Span _display="block" _color="#000" _fontSize="16px" _padding="5px">
        add, commit, push
      </Span>
      <Span _display="block" _color="#969595" _fontSize="13px" _padding="5px">
        author by Daisy
      </Span>
    </Form>
  );
};

export default TodoListItem;
