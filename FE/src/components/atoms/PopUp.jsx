import styled from 'styled-components';

const PopUp = ({ isDeleteBtnClicked, rewind, newColumns, deleteCard }) => {
  if (isDeleteBtnClicked) {
    return (
      <PopUpBg>
        <StyledPopUp>
          <h3 className="warning">😱정말 삭제하시겠습니까?😱</h3>
          <div className="warning-btns">
            <button className="cancel" onClick={rewind}>
              취소
            </button>
            <button className="delete" onClick={() => deleteCard(newColumns)}>
              삭제
            </button>
          </div>
        </StyledPopUp>
      </PopUpBg>
    );
  } else return <></>;
};

export default PopUp;

const PopUpBg = styled.div`
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
  padding: 24px;
  position: relative;
  width: 500px;
  height: 200px;
  background: #ffffff;
  box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5),
    0px 2px 4px rgba(0, 0, 0, 0.25);
  border-radius: 6px;

  .warning {
    padding: 1rem;
    font-size: 2rem;
    color: #d63030;
  }

  .warning-btns {
    margin: 0 auto;
    display: flex;
    justify-content: center;
  }

  button {
    margin: 0 1rem;
    width: 130px;
    height: 40px;
    border-radius: 6px;
    border: 0;
    outline: 0;
    cursor: pointer;
    text-align: center;
    color: #ffffff;
  }

  .cancel {
    color: #828282;
  }

  .delete {
    background: #0075de;
  }
`;
