import styled from 'styled-components';

const InputTitle = styled.input`
  height: 23px;
  width: 276px;
  border-radius: nullpx;
  font-family: Noto Sans KR;
  font-size: 16px;
  font-style: normal;
  font-weight: 700;
  line-height: 23px;
  letter-spacing: 0em;
  text-align: left;
  border: 0;
  outline: 0;
  overflow-wrap: wrap;
`;

const InputContent = styled.textarea`
  height: 40px;
  width: 276px;
  left: 0px;
  top: 31px;
  font-family: Noto Sans KR;
  font-size: 14px;
  font-style: normal;
  font-weight: 400;
  line-height: 20px;
  letter-spacing: 0em;
  text-align: left;
  border: 0;
  outline: 0;
  overflow: hidden;
  resize: none;
`;

export { InputTitle, InputContent };
