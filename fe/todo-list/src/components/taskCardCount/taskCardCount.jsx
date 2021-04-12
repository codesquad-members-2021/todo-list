import React from 'react';
import styled from 'styled-components';

const TaskCardCount = props => {
  return (
    <CountBadge>
      <CountNumber>10</CountNumber>
    </CountBadge>
  );
};

export default TaskCardCount;

const CountBadge = styled.div`
  width: 26px;
  height: 26px;
  border-radius: 20px;
  background: #bdbdbd;
  display: flex;
  align-items: center;
  justify-content: center;
`;

const CountNumber = styled.span`
  font-weight: bold;
  font-size: 14px;
  line-height: 20px;
  color: #010101;
`;
