import React from 'react';
import styled from 'styled-components';
// import { ViewState } from './const.js';

function TodoCardPresentational(props) {
  // TODO: '{author} by web'

  return (
    <Card>
      <Title onChange={props.onChangeTitle} placeholder="제목을 입력하세요" value={props.state.title}></Title>
      <Content onChange={props.onChangeContent} maxlength="500" placeholder="내용을 입력하세요" value={props.state.content}></Content>
      <div>
        <CancelBtn onClick={props.onClickCancelBtn}>취소</CancelBtn>
        <ConfirmBtn
          onClick={props.onClickConfirmBtn}
          disabled={props.state.title.length > 0 && props.state.content.length > 0 ? false : true}>
            확인
        </ConfirmBtn>
      </div>
    </Card>
  );
}

export default TodoCardPresentational;

const Card = styled.div`
  display: flex;
  flex-direction: column;
  padding: 16px;
  width: 310px;
  height: auto;
  background: #FFFFFF;
  border: 1px solid #0075DE;
  box-sizing: border-box;
  box-shadow: 0px 1px 30px rgba(224, 224, 224, 0.3);
  border-radius: 6px;

  &.select {
    
  }

  &.delete {
    // TODO
  }

  &.drag {
    // TODO
  }
`;

const Title = styled.input`
  width: 100%;
  height: 23px;
  box-sizing: border-box;
  font-family: Noto Sans KR;
  font-style: normal;
  font-weight: bold;
  font-size: 16px;
  line-height: 23px;
  color: #010101;
  margin-bottom: 8px;
  border: none;
  outline: none;
`;

const Content = styled.textarea`
  width: 100%;
	height: 26px;
  resize: none;
  box-sizing: border-box;
  font-family: Noto Sans KR;
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 20px;
  color: #010101;
  margin: 8px 0px;
  border: none;
  outline: none;
`;


const CancelBtn = styled.button`
  float: left;
  padding: 10px;
  width: 134px;
  height: 40px;
  background: #E0E0E0;
  color: white;
  font-weight: 800;
  border: none;
  border-radius: 6px;

  &:hover {
    background: #828282;
  }
`;

const ConfirmBtn = styled.button`
  float: right;
  padding: 10px;
  width: 134px;
  height: 40px;
  background: #0075DE;
  color: white;
  font-weight: 800;
  border: none;
  border-radius: 6px;

  &:hover {
    background: #00529B;
  }

  &:disabled {
    background: #86C6FF;
  }
`;