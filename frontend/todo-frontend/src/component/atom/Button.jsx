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
  background-color: rgba(0, 117, 222, 1);
  opacity: ${(props) => (props.disabled ? "0.5" : "1")};
`;

const CancelButton = styled.button`
  ${commonBtn};
  color: white;
  background-color: #e0e0e0;
`;

export const ConfirmBtn = ({ value, type, handleClick, disabled }) => {
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
    <ConfirmButton type={type ? type : ""} onClick={handleClick}>
      {value}
    </ConfirmButton>
  );
};
