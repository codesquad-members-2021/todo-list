import styled from "styled-components";

import { BUTTON_TYPE, BUTTON_STYLE } from "./constant.js";

const StyledButton = styled.button`
  outline: none;
  border: none;
  background: none;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  ${(props) => {
    return props.t && BUTTON_STYLE[props.t];
  }}
  ${(props) => {
    return props.s && BUTTON_STYLE[props.s];
  }};
`;

export default function Button({ type, subType, onClick }) {
  return (
    <StyledButton t={type} s={subType} onClick={onClick}>
      {BUTTON_TYPE[type]}
    </StyledButton>
  );
}
