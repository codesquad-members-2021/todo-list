import styled, { css } from "styled-components";
import { BUTTON_TYPE } from "./constant.js";

const StyledButton = styled.button`
  width: 32px;
  height: 32px;
  outline: none;
  border: none;
  background: none;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  ${(props) => {
    props.size &&
      css`
        width: ${props.size}px;
        height: ${props.size}px;
        background: blue;
        color: white;
      `;
  }}
`;

export default function IconButton({ cb, type, size }) {
  return (
    <StyledButton size={size} onClick={cb}>
      {BUTTON_TYPE[type]}
    </StyledButton>
  );
}
