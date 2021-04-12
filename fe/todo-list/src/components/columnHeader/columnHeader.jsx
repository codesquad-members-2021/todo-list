import React from 'react';
import TaskCardCount from '../taskCardCount/taskCardCount';
import Icon from '../icon/icon';
import styled from 'styled-components';

const ColumnHeader = props => {
  return (
    <ColumnHeaderContainer>
      <ColumnTitleBox>
        <ColumnTitle>제목</ColumnTitle>
        <TaskCardCount />
      </ColumnTitleBox>
      <ColumnButtonBox>
        <Icon type="add" />
        <Icon type="delete" />
      </ColumnButtonBox>
    </ColumnHeaderContainer>
  );
};

export default ColumnHeader;

const ColumnHeaderContainer = styled.div`
  display: flex;
  justify-content: space-between;
  width: 300px;
`;

const ColumnTitleBox = styled.div`
  display: flex;
  align-items: center;
`;

const ColumnTitle = styled.span`
  font-weight: bold;
  font-size: 18px;
  line-height: 26px;
  margin-right: 10px;
`;

const ColumnButtonBox = styled.div``;
