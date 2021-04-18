import React, { useState } from 'react';
import PopUp from './PopUp';
import styled from 'styled-components';

const DeleteButton = styled.svg`
  fill: #aaaaaa;
  &:hover {
    fill: rgba(255, 67, 67, 1);
  }
  margin: 0 5px;
`;

const DeleteBtn = ({ deleteFn, handleDeleteOver, handleDeleteLeave }) => {
  const [deleteBtnClicked, setDeleteBtnClicked] = useState(false);
  const toggleDeleteBtnClicked = () => {
    setDeleteBtnClicked((deleteBtnClicked) => !deleteBtnClicked);
  };
  if (deleteBtnClicked) {
    return (
      <>
        <PopUp
          title={'진짜 삭제하시겠습니까?'}
          togglePopUp={toggleDeleteBtnClicked}
          confirmCallback={deleteFn}
        />

        <DeleteButton
          onClick={toggleDeleteBtnClicked}
          width='12'
          height='12'
          viewBox='0 0 12 12'
          fill='none'
          xmlns='http://www.w3.org/2000/svg'
        >
          <path
            d='M1.5 11.25L0.75 10.5L5.25 6L0.75 1.5L1.5 0.75L6 5.25L10.5 0.75L11.25 1.5L6.75 6L11.25 10.5L10.5 11.25L6 6.75L1.5 11.25Z'
            fill='black'
          />
        </DeleteButton>
      </>
    );
  } else {
    return (
      <DeleteButton
        onClick={toggleDeleteBtnClicked}
        onMouseEnter={handleDeleteOver}
        onMouseLeave={handleDeleteLeave}
        width='12'
        height='12'
        viewBox='0 0 12 12'
        fill='none'
        xmlns='http://www.w3.org/2000/svg'
      >
        <path d='M1.5 11.25L0.75 10.5L5.25 6L0.75 1.5L1.5 0.75L6 5.25L10.5 0.75L11.25 1.5L6.75 6L11.25 10.5L10.5 11.25L6 6.75L1.5 11.25Z' />
      </DeleteButton>
    );
  }
};

export default DeleteBtn;
