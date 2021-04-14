import React, { useState } from "react";
import LogHideButtonStyle from './logHideButton.style';
import { ReactComponent as HideBtn } from '../../style/deleteIcon.svg';
// import styled from 'styled-components';

const LogHideButton = ({handleLogRender}) => {
  return (
    <LogHideButtonStyle className="log-hide-button-section">
      <HideBtn className="log-hide-button" onClick={handleLogRender}/>
    </LogHideButtonStyle>
  );
};

export default LogHideButton;
