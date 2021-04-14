import React, { useState, useRef } from "react";
import TitleInput from "../../atoms/TitleInput";
import ContentInput from "../../atoms/ContentInput";
import SmallButton from "../../atoms/Buttons/SmallButton";
import Image from "../../atoms/Image";
import closeButton from "../../../images/closeButton.svg";
import ButtonList from "../../atoms/Buttons/ButtonList";
import styled from "styled-components";
import axios from "axios";

const Div = styled.div`
  position: relative;
  width: 308px;
  padding: 16px;
  margin: 16px;
  background: #fff;
  border: 2px solid #000;
  border-radius: 5px;
  cursor: pointer;
`;

const TodoListInput = ({
  columnId,
  id,
  title,
  content,
  toggleActions2,
  toggleActions,
  columnName,
  setTodos,
  setHistories,
  isPatch,
}) => {
  const [titleValue, setTitle] = useState(title);
  const [contentValue, setContent] = useState(content);
  const titleRef = useRef(null);
  const contentRef = useRef(null);
  const onChange = (setState, { target }) => {
    setState(target.value);
  };

  const enrollClickHandler = async isPatch => {
    const currentTitle = titleRef.current.value;
    const currentContent = contentRef.current.value;
    let response;

    if (isPatch) {
      response = await axios.patch("/todos", {
        columnId,
        id,
        title: currentTitle,
        content: currentContent,
      });
    } else {
      response = await axios.put(
        `/todos?columnId=${columnId}&title=${currentTitle}&content=${currentContent}&author=${"데이지"}` //
      );
    }

    setHistories(histories => {
      const newHistory = {
        index: histories[histories.length - 1].index + 1,
        action: "수정",
        currentColumn: columnName,
        currentTitle,
        currentContent,
        prevTitle: title,
        user: "Beemo",
      };
      return histories.concat(newHistory);
    });
    setTodos(() => response.data);
  };

  return (
    <Div>
      <SmallButton _position="absolute" _right="3px">
        <Image src={closeButton} _width="10px" />
      </SmallButton>
      <TitleInput
        placeholder="제목을 적어주세요"
        onChange={e => onChange(setTitle, e)}
        value={titleValue || ""}
        titleRef={titleRef || ""}
      />
      <ContentInput
        placeholder="내용을 적어주세요"
        onChange={e => onChange(setContent, e)}
        value={contentValue || ""}
        contentRef={contentRef || ""}
      />

      <ButtonList
        {...{ toggleActions2, enrollClickHandler, toggleActions, isPatch }}
      />
    </Div>
  );
};

export default TodoListInput;
