import styled from "styled-components";

const ButtonAccent = styled.button`
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;

  width: 134px;
  height: 40px;

  background: #0075de;
  border-radius: 6px;
  cursor: pointer;

  &:hover {
    background: #00529b;
  }

  &:disabled {
    background: #86c6ff;
    cursor: default;
  }
`;

const ButtonAccentText = styled.div`
  font-weight: bold;
  font-size: 14px;
  line-height: 20px;
  text-align: center;

  color: #ffffff;

  margin: 0px 10px;

  &:hover {
    color: #ffffff;
  }

  &:disabled {
    color: rgba(255, 255, 255, 0.4);
  }
`;

export { ButtonAccent, ButtonAccentText };
