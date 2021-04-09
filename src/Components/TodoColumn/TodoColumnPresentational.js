import React from 'react'
import styled from 'styled-components';

function TodoColumnPresentational(props) {
  return (
    <Column>
      <TopBar>
        <Title>{props.title}</Title>
        <CardCnt>{props.todoCnt}</CardCnt>
        <DeleteBtn>x</DeleteBtn>
        <AddBtn>+</AddBtn>
      </TopBar>
      {props.todos}
    </Column>
  );
}

export default TodoColumnPresentational;

const Column = styled.div`
  display: inline-block;
  vertical-align: top;
`;

const TopBar = styled.div`
  display: inline-block;
  padding: 0px 8px;
  width: 308px;
  height: 26px;
`;

const Title = styled.div`
  float: left;
  width: 114px;
  height: 26px;
  font-family: "Noto Sans KR";
  font-style: normal;
  font-weight: bold;
  font-size: 18px;
  line-height: 26px;
  color: #010101;
`;

const CardCnt = styled.div`
  float: left;
  width: 26px;
  height: 26px;
  font-family: "Noto Sans KR";
  font-style: normal;
  font-weight: bold;
  font-size: 14px;
  line-height: 20px;
  text-align: center;
  color: #010101;
  margin: 0px 10px;
  background: #BDBDBD;
  border-radius: 20px;
`;

const AddBtn = styled.button`
  float: right;
  border: none;
  outline: none;
  //background-color: #BDBDBD;
  background-color: transparent;
  color: #BDBDBD;

  &:hover {
    /* background-color: #0075DE; */
    color: #0075DE;
  }
`;

const DeleteBtn = styled.button`
  float: right;
  border: none;
  outline: none;
  /* background-color: #BDBDBD; */
  background-color: transparent;
  color: #BDBDBD;

  &:hover {
    /* background-color: #FF4343; */
    color: #FF4343;
  }
`;

