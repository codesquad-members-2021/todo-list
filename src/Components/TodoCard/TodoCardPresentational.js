import React from 'react'
import styled from 'styled-components';
import { State } from './const.js';

// 1. comment syntax in styled-components
// 2. 

function TodoCardPresentational(props) {
  const renderNormal = () => {
    return (
      <Card>
        <Title type="textfield" placeholder="제목을 입력하세요" />
        <Content type="textarea" placeholder="내용을 입력하세요" />
        <div>
          <CancelBtn>취소</CancelBtn>
          <ConfirmBtn>확인</ConfirmBtn>
        </div>
      </Card>
    );
  }

  const renderSelect = () => {
    // TODO
  }

  const renderDelete = () => {
    // TODO
  }

  const renderDrag = () => {
    // TODO
  }
  
  if (props.state === State.NORMAL) {
    return renderNormal();
  } else {
    // TODO, FIXME
    throw Error('not reached!');
  }
}

export default TodoCardPresentational;

const Card = styled.div`
  display: flex;
  flex-direction: column;
  padding: 16px;
  width: 310px;
  height: 139px;
  background: #FFFFFF;
  border: 1px solid #0075DE;
  box-sizing: border-box;
  box-shadow: 0px 1px 30px rgba(224, 224, 224, 0.3);
  border-radius: 6px;
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
`;

const Content = styled.input`
  width: 100%;
  height: 20px;
  box-sizing: border-box;
  font-family: Noto Sans KR;
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 20px;
  color: #010101;
  margin: 8px 0px;
`;

const CancelBtn = styled.button`
  float: left;
  display: inline-block;
  padding: 10px;
  width: 134px;
  height: 40px;
  background: #E0E0E0;
  border-radius: 6px;
  // margin: 0px 8px;
`;

const ConfirmBtn = styled.button`
  float: right;
  display: inline-block;
  padding: 10px;
  width: 134px;
  height: 40px;
  background: #0075DE;
  border-radius: 6px;
  // margin: 0px 8px;
`;
