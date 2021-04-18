import React from 'react';
import { ConfirmBtn, CancelBtn } from './Button.jsx';
import styled from 'styled-components';
import { TodoCardBtnWrapper, TodoCardTitle } from '../todoMain/todoList/TodoItem';

const PopUpBackground = styled.div`
  position: absolute;
  display: flex;
  align-items: center;
  justify-content: center;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.3);
`;

const StyledPopUp = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  padding: 24px;
  position: relative;
  width: 328px;
  height: 118px;
  background: #ffffff;
  box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5), 0px 2px 4px rgba(0, 0, 0, 0.25);
  border-radius: 6px;
`;

const PopUp = ({ title, togglePopUp, confirmCallback }) => {
  const handleConfirmClick = () => {
    confirmCallback();
    togglePopUp();
  };
  const handelCancelClick = () => {
    togglePopUp();
  };
  return (
    <PopUpBackground>
      <StyledPopUp>
        <TodoCardTitle>{title}</TodoCardTitle>
        <TodoCardBtnWrapper>
          <ConfirmBtn value='확인' handleClick={handleConfirmClick} />
          <CancelBtn value='취소' handleClick={handelCancelClick} />
        </TodoCardBtnWrapper>
      </StyledPopUp>
    </PopUpBackground>
  );
};

export default PopUp;
