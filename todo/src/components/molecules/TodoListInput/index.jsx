import React from "react";
import styled from "styled-components";
import TitleInput from "../../atoms/TitleInput";
import ContentInput from "../../atoms/ContentInput";
import SmallButton from "../../atoms/SmallButton";
import Image from "../../atoms/Image";
import closeButton from "../../../images/closeButton.svg";
import ButtonList from "../ButtonList";

const TodoListInput = () => {
  return (
    <>
      <SmallButton _position="absolute" _right="3px">
        <Image src={closeButton} _width="10px" />
      </SmallButton>
      <TitleInput placeholder="제목을 적어주세요"></TitleInput>
      <ContentInput placeholder="내용을 적어주세요"></ContentInput>
      <ButtonList></ButtonList>
    </>
  );
};

export default TodoListInput;
