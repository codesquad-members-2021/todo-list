import styled, { css } from "styled-components";
import { BUTTON_TYPE } from "./constant.js";
const textBtn = [];
const iconBtn = [];
const StyledButton = styled.button`
  outline: none;
  border: none;
  background: none;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  ${(props) => {
    switch (props.t) {
      case "cancel":
        return css`
          width: 134px;
          height: 40px;
          border-radius: 6px;
          margin: 0px 4px;
          background: #e0e0e0;
          color: black;
        `;
      case "enroll":
        return css`
          width: 134px;
          height: 40px;
          border-radius: 6px;
          margin: 0px 4px;
          background: #0075de;
          color: white;
        `;
      case "add":
        return (
          props.s &&
          css`
            width: ${props.size}px;
            height: ${props.size}px;
            background: blue;
            color: white;
          `
        );

      default:
        return;
    }
  }}
`;

export default function Button({ onClick, type, size }) {
  return (
    <StyledButton s={size} onClick={onClick} t={type}>
      {BUTTON_TYPE[type]}
    </StyledButton>
  );
}
