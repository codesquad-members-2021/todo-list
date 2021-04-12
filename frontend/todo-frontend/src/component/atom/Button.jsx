import React from "react";
import styled, { css } from "styled-components";

const commonBtn = css`
  height: 40px;
  width: 134px;
  border-radius: 6px;
  padding: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  border: none;
`;

const ConfirmButton = styled.button`
  ${commonBtn};
  color: white;
  background-color: #126e82;
  opacity: ${(props) => (props.disabled ? "0.5" : "1")};
`;

const CancelButton = styled.button`
  ${commonBtn};
  color: gray;
  background-color: #d8e3e7;
`;

export const ConfirmBtn = ({ value, type, handleClick, disabled = false }) => {
  return (
    <ConfirmButton
      type={type ? type : ""}
      onClick={handleClick}
      disabled={disabled}
    >
      {value}
    </ConfirmButton>
  );
};
export const CancelBtn = ({ value, type, handleClick }) => {
  return (
    <CancelButton type={type ? type : ""} onClick={handleClick}>
      {value}
    </CancelButton>
  );
};
