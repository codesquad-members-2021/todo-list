import styled from 'styled-components';

const FormButtonsWrap = ({ handleClickCancel }) => {
  return (
    <FormButtons>
      <button className="button__cancel" onClick={handleClickCancel}>
        <span className="click__cancel">취소</span>
      </button>
      <button className="button__add">
        <span className="click__add">등록</span>
      </button>
    </FormButtons>
  );
};

export default FormButtonsWrap;

const FormButtons = styled.div`
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

  .button__add {
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

  .click__add {
    width: 114px;
    height: 20px;

    font-family: Noto Sans KR;
    font-style: normal;
    font-weight: bold;
    font-size: 14px;
    text-align: center;

    color: rgba(255, 255, 255, 0.4);
  }
`;
