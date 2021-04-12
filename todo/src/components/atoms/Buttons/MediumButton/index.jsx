import React from "react";
import styled from "styled-components";

const MediumButton = styled.button`
    width: 100px;
    height: 30px;
    padding: 5px;
    /* border: none; */
    border: solid 0.05rem black;
    border-radius: 6px;
    background:${props => props._background};
    color:${props => props._color};
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