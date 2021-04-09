import React from 'react';
import styled from 'styled-components';
import Button from '../button/button';
import Icon from '../icon/icon';

const DefaultTask = () => {
  return (
    <TaskBox>
      <IconPosition>
        <Icon type="delete" />
      </IconPosition>
      <TextArea>
        <TaskTitle />
        <TaskContents />
        <Caption />
      </TextArea>
    </TaskBox>
  );
};

const ActiveTask = () => {
  return (
    <TaskBox>
      <TextArea>
        <TaskTitle />
        <TaskContents />
      </TextArea>
      <ButtonArea>
        <Button type="cancel" name="취소" />
        <Button type="submit" name="등록" />
      </ButtonArea>
    </TaskBox>
  );
};

const TaskTitle = () => {
  return (
    <TitleBox>
      <TaskTitleSpan>Title</TaskTitleSpan>
    </TitleBox>
  );
};

const TaskContents = () => {
  return (
    <ContentsBox>
      <TaskContentsSpan>Body</TaskContentsSpan>
    </ContentsBox>
  );
};

const Caption = () => {
  return (
    <>
      <TaskAuthorLabel>author by web</TaskAuthorLabel>
    </>
  );
};

const Card = ({ type }) => {
  return {
    default: <DefaultTask />,
    active: <ActiveTask />,
  }[type];
};

export default Card;

const TaskBox = styled.div`
  position: relative;
  width: 300px;
  background: #ffffff;
  box-shadow: 0px 1px 30px rgba(224, 224, 224, 0.3);
  border-radius: 6px;
  padding: 10px 16px;

  & + div {
    margin-top: 20px;
  }
`;

const TextArea = styled.div`
  display: flex;
  flex-direction: column;
`;

const ButtonArea = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
`;

const TitleBox = styled.div`
  display: flex;
  justify-content: space-between;
`;

const ContentsBox = styled.div`
  display: flex;
  flex-direction: column;
  text-align: left;
  margin-bottom: 5px;
`;

const TaskTitleSpan = styled.span`
  font-size: 16px;
  font-weight: bold;
  line-height: 23px;
  color: #010101;
  margin: 8px 0px;
`;

const TaskContentsSpan = styled.span`
  font-size: 14px;
  line-height: 20px;
  color: #010101;
`;

const TaskAuthorLabel = styled.span`
  font-size: 12px;
  line-height: 17px;
  color: #bdbdbd;
  text-align: left;
`;

const IconPosition = styled.div`
  position: absolute;
  top: 15px;
  right: 10px;
`;
