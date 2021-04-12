import React from "react";
import styled from "styled-components";

const StyledInput = styled.input`
  width: 252px;
  border: none;
  outline: none;
  height: ${(props) => (props.name === "title" ? "23px" : "20px")};
  font-size: ${(props) => (props.name === "title" ? "1rem" : "0.8rem")};
  font-weight: ${(props) => (props.name === "title" ? "600" : "400")};
`;

const Input = ({ name, defaultValue, handleChange, placeholder, ref }) => {
  return (
    <StyledInput
      type="text"
      name={name}
      value={defaultValue}
      onChange={handleChange}
      placeholder={placeholder}
      ref={ref}
    ></StyledInput>
  );
};

export default Input;
