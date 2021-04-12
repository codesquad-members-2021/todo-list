import React from "react";
import styled from "styled-components";
import TitleInput from "../../atoms/TitleInput";
import ContentInput from "../../atoms/ContentInput";
import SmallButton from "../../atoms/Buttons/SmallButton";
import Image from "../../atoms/Image";
import closeButton from "../../../images/closeButton.svg";
import ButtonList from "../../atoms/Buttons/ButtonList";

const Div = styled.div`
  position: relative;
  width: 308px;
  padding: 16px;
  margin: 16px;
  background: #fff;
  border-radius: 5px;
`;

const TodoListInput = () => {
  return (
    <Div>
      <SmallButton _position="absolute" _right="3px">
        <Image src={closeButton} _width="10px" />
      </SmallButton>
      <TitleInput placeholder="제목을 적어주세요"></TitleInput>
      <ContentInput placeholder="내용을 적어주세요"></ContentInput>
      <ButtonList></ButtonList>
    </Div>
  );
};

export default TodoListInput;
