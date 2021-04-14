import styled from 'styled-components';

const CardButtonWrap = ({ handleClickEdit, handleCancelBtn, hasInput }) => {
  return (
    <CardButtons>
      <button className="button__cancel" onClick={handleCancelBtn}>
        <span className="click__cancel">취소</span>
      </button>
      <button
        className={'button__edit'}
        disabled={hasInput ? false : true}
        onClick={handleClickEdit}
      >
        <span className={'click__edit'}>수정</span>
      </button>
    </CardButtons>
  );
};

export default CardButtonWrap;

const CardButtons = styled.div`
  display: flex;
  width: 100%;
  justify-content: space-around;
  padding: 0.25rem;

  .button__cancel {
    display: flex;
    padding: 10px;

    width: 130px;
    height: 40px;

    background: #e0e0e0;
    border-radius: 6px;
    border: 0;
    outline: 0;
    cursor: pointer;
  }

  .button__edit {
    display: flex;
    padding: 10px;

    width: 130px;
    height: 40px;

    background: #86c6ff;
    border-radius: 6px;
    border: 0;
    outline: 0;
    cursor: pointer;
  }

  .click__cancel {
    width: 114px;
    height: 20px;
    font-family: Noto Sans KR;
    font-style: normal;
    font-weight: normal;
    font-size: 14px;
    text-align: center;
    color: #828282;
  }

  .click__edit {
    width: 114px;
    height: 20px;

    font-family: Noto Sans KR;
    font-style: normal;
    font-weight: bold;
    font-size: 14px;
    text-align: center;

    color: rgba(255, 255, 255, 0.4);
  }

  .btn--active {
    background: #0075de;
  }

  .span--active {
    color: #ffffff;
  }
`;
