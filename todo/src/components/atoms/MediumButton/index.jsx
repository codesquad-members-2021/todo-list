import React from "react";
import styled from "styled-components";

const MediumButton = styled.button`
    width: 100px;
    height: 30px;
    padding: 5px;
    /* border: none; */
    border: solid 0.15rem black;
    border-radius: 6px;
    background-color:${props => props.BtnColor};
    color:${props => props.textColor};
    cursor: pointer;
    margin: 3px;

    &:focus {
      outline:none;
    }
    &:hover {
      outline:none;
      
    }
`;

const Button = ({ children, ...props }) => (
  <MediumButton {...props}>{children}</MediumButton>
);

export default Button;