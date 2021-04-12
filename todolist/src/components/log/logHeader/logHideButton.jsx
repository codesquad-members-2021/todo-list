import React, { useState } from "react";
import LogHideButtonStyle from './logHideButton.style';
import { ReactComponent as HideBtn } from '../../style/deleteIcon.svg';
import styled from 'styled-components';

let logHide = () => {
  console.log("A")
  // <div style={{ display: showInfo ? "block" : "none" }}>info</div>
}
const Button = styled.button`
  /* Adapt the colors based on primary prop */
  background: ${props => props.primary ? "palevioletred" : "white"};
  color: ${props => props.primary ? "white" : "palevioletred"};

  font-size: 1em;
  margin: 1em;
  padding: 0.25em 1em;
  border: 2px solid palevioletred;
  border-radius: 3px;
`;

const LogHideButton = () => {
  return (
    <LogHideButtonStyle className="log-hide-button-section">
      <HideBtn className="log-hide-button" onClick={logHide}/>
    </LogHideButtonStyle>
  );
};

export default LogHideButton;
