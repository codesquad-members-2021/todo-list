import React from 'react';
import styled from 'styled-components';
import Icon from '../icon/icon';

const Task = () => {
  return (
    <TaskBox>
      <TaskTitle />
      <TaskContents />
    </TaskBox>
  );
};

const TaskTitle = () => {
  return (
    <TitleBox>
      <TaskTitleSpan>Title</TaskTitleSpan>
      <Icon type="delete" />
    </TitleBox>
  );
};

const TaskContents = () => {
  return (
    <ContentsBox>
      <TaskContentsSpan>Body</TaskContentsSpan>
      <TaskAuthorLabel>author by web</TaskAuthorLabel>
    </ContentsBox>
  );
};

const Card = ({ type }) => {
  return {
    default: <Task />,
  }[type];
};

export default Card;

const TaskBox = styled.div`
  display: flex;
  flex-direction: column;
  width: 300px;
  background: #ffffff;
  box-shadow: 0px 1px 30px rgba(224, 224, 224, 0.3);
  border-radius: 6px;
  padding: 16px;

  & + div {
    margin-top: 20px;
  }
`;

const TitleBox = styled.div`
  display: flex;
  justify-content: space-between;
`;

const ContentsBox = styled.div`
  display: flex;
  flex-direction: column;
  text-align: left;
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
`;
