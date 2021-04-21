import React, { useState } from "react";
import styled from "styled-components";
import { FaPlus, FaTimes } from 'react-icons/fa';
import Button from "../Button";
import { useTodoDispatch } from '../Context'

const TodoColumnHeadBlock = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  & > div {
    display: flex;
    align-items: center;
    padding: 0 0.5rem;
    width: 75%;
  }
`;

const HeadText = styled.div``;

const Title = styled.input.attrs({
    type: "text"
  })`
  font-size: 1rem;
  background-color: transparent;
  font-weight: 600;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  margin-right: 0.4rem;
`;

const Counter = styled.span`
  background-color: #fff;
  color: #333;
  border-radius: 50%;
  font-weight: 400;
  padding: 0.5rem 0.8rem;
  min-width: 1.8rem;
  text-align: center;
`

const HeadButtons = styled.div`
  button {
    padding: 0.4rem;
    line-height: 0rem;
    &:first-child {
      color: ${({toggle}) => toggle ? '#ffcc00': '#000'};
    }
    &:hover {
      color: #ffcc00;
    }
  }
`;

const TodoColumnHead = ({ title, count, toggle, onClick, onRemoveColumn, index }) => {
  const [titleText, setTitleText] = useState(title);
  const dispatch = useTodoDispatch();
  const onChange = ({target}) => {
    setTitleText(target.value);
  }
  const onBlur = () => {
    dispatch({ type: "UPDATECOLUMNTITLE", title: titleText, index});
  }
  return (
    <TodoColumnHeadBlock>
      <HeadText>
        <Title onChange={onChange} onBlur={onBlur} value={titleText}/>
        <Counter>{count}</Counter>
      </HeadText>
      <HeadButtons toggle={toggle}>
        <Button onClick={onClick}><FaPlus/></Button>
        <Button onClick={onRemoveColumn}><FaTimes/></Button>
      </HeadButtons>
    </TodoColumnHeadBlock>
  )
}

export default TodoColumnHead;