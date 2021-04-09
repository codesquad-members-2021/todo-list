import React from 'react';
import style from './popUp.module.css';

const PopUp = ({ title, togglePopUp, confirmCallback }) => {
  const handleConfirmClick = () => {
    confirmCallback();
    togglePopUp();
  };
  const handelCancelClick = () => {
    togglePopUp();
  };
  return (
    <div className={style.backgroundWrapper}>
      <div className={style.popUp}>
        <div>{title}</div>
        <div className={style.popUpBtns}>
          <button onClick={handelCancelClick}>취소</button>
          <button onClick={handleConfirmClick}>확인</button>
        </div>
      </div>
    </div>
  );
};

export default PopUp;
