import React from 'react';
import styled from 'styled-components';
import { ViewState } from './const.js';

function TodoCardPresentational(props) {
  const renderNonEdit = () => {
    // TODO, FIXME
    return (
      <div>
        <Caption>TMP: Neis by web</Caption>
        <DeleteBtn>X</DeleteBtn>
      </div>
    );
  }

  const renderEdit = () => {
    return (
      <div>
        <CancelBtn onClick={props.onClickCancelBtn}>취소</CancelBtn>
        <ConfirmBtn
          onClick={props.onClickConfirmBtn}
          disabled={props.state.title.length > 0 && props.state.content.length > 0 ? false : true}>
            확인
        </ConfirmBtn>
      </div>
    );
  }

  const isEditMode = () => props.viewState === ViewState.EDIT;

  return (
    <Card className={props.viewState} onDoubleClick={props.onDoubleClick}>
      <Title
        onChange={props.onChangeTitle}
        autoFocus={true}
        placeholder="제목을 입력하세요"
        value={props.state.title}
        disabled={isEditMode() ? false : true} />
      <Content
        onChange={props.onChangeContent}
        maxlength="500"
        placeholder="내용을 입력하세요"
        value={props.state.content}
        disabled={isEditMode() ? false : true} />
      {isEditMode() ? renderEdit() : renderNonEdit()}
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
  position: relative;
  box-sizing: border-box;
  background: #FFFFFF;
  box-shadow: 0px 1px 30px rgba(224, 224, 224, 0.3);
  border-radius: 6px;

  &:not(.edit):hover {
    background: rgba(255, 255, 255, 0.8);
    box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5), 0px 2px 4px rgba(0, 0, 0, 0.25);
    /* backdrop-filter: blur(4px); */
  }

  &.edit {
    padding: 15px;
    border: 1px solid #0075DE;
    
    box-shadow: 0px 1px 30px rgba(224, 224, 224, 0.3);
  }

  &.delete {
    // TODO
  }

  &.drag-float {
    // TODO
  }

  &.drag-origin {
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

  &:disabled {
    pointer-events: none;
  }
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

  &:disabled {
    pointer-events: none;
  }
`;


const CancelBtn = styled.button`
  float: left;
  padding: 10px;
  width: 134px;
  height: 40px;
  background: #E0E0E0;
  color: #828282;
  font-weight: 800;
  border: none;
  border-radius: 6px;
  
  &:hover {
    background: #828282;
    color: white;
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

const Caption = styled.div`
  float: left;
  height: 17px;
  font-family: Noto Sans KR;
  font-style: normal;
  font-weight: normal;
  font-size: 12px;
  line-height: 17px;
  color: #BDBDBD;
  margin: 8px 0px;
`;

const DeleteBtn = styled.button`
  // TODO, FIXME
  position: absolute;
  top: 16px;
  right: 16px;
  /* background: #828282; */
  background:transparent;
  border: none;
  color: #828282; 

  &:hover {
    /* background: #FF4343; */
    color: #FF4343; // FIXME: delete
  }

  &.drag-origin {
    /* background: #828282; */
    color: #828282; // FIXME: delete
  }
`;