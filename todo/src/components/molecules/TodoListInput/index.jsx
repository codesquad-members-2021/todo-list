import React from "react";
import TitleInput from "../../atoms/TitleInput";
import ContentInput from "../../atoms/ContentInput";
import SmallButton from "../../atoms/Buttons/SmallButton";
import Image from "../../atoms/Image";
import closeButton from "../../../images/closeButton.svg";
import ButtonList from "../../atoms/Buttons/ButtonList";
import styled from 'styled-components';
import { useState } from 'react';

const Div = styled.div`
  text-align: center;
  margin: 15px 0 0 0;
`

const TodoListInput = ({ title, content, toggleActions }) => {

  const [titleValue, setTitle] = useState(title);
  const [contentValue, setContent] = useState(content);

  const onChange = (setState, { target }) => {
    setState(target.value);
  }

  return (
    <>
      <SmallButton _position="absolute" _right="3px">
        <Image src={closeButton} _width="10px" />
      </SmallButton>
      <TitleInput placeholder="제목을 적어주세요" onChange={(e) => onChange(setTitle, e)} value={titleValue} />
      <ContentInput placeholder="내용을 적어주세요" onChange={(e) => onChange(setContent, e)} value={contentValue} />
      <Div>
        <ButtonList toggleActions={toggleActions} />
      </Div>
    </>
  );
};

export default TodoListInput;