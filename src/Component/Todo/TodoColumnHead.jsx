import React from "react";
import styled from "styled-components";
import { FaPlus, FaTimes } from 'react-icons/fa';
import Button from "../Button";

const TodoColumnHeadBlock = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  & > div {
    display: flex;
    align-items: center;
    padding: 0 0.5rem;
  }
`;

const HeadText = styled.div``;

const Title = styled.h2`
  font-size: 1rem;
  font-weight: 600;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  margin-right: 0.4rem;
`;

const Counter = styled.span`
  background-color: #999;
  border-radius: 50%;
  font-weight: 600;
  padding: 0.2rem;
  min-width: 1.8rem;
  text-align: center;
`

const HeadButtons = styled.div`
  button {
    padding: 0.4rem;
    line-height: 0rem;
    &:hover {
      color: #ffcc00;
    }
    &:first-child {
      color: ${({toggle}) => toggle ? '#ffcc00': '#000'};
    }
  }
`;

const TodoColumnHead = ({ title, count, toggle, onClick, onAllRemove }) => {
  return (
    <TodoColumnHeadBlock>
      <HeadText>
        <Title>{title}</Title>
        <Counter>{count}</Counter>
      </HeadText>
      <HeadButtons toggle={toggle}>
        <Button onClick={onClick}><FaPlus/></Button>
        <Button onClick={onAllRemove}><FaTimes/></Button>
      </HeadButtons>
    </TodoColumnHeadBlock>
  )
}

export default TodoColumnHead;