import React, { useState } from 'react';
import PopUp from './PopUp';

const DeleteBtn = ({ deleteFn }) => {
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
        <button onClick={toggleDeleteBtnClicked}>❌</button>
      </>
    );
  } else {
    return <button onClick={toggleDeleteBtnClicked}>❌</button>;
  }
};

export default DeleteBtn;
