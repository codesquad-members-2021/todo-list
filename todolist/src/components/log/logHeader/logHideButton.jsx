import React from 'react';
import LogHideButtonStyle from './logHideButton.style';
import { ReactComponent as HideBtn } from '../../style/deleteIcon.svg';

const LogHideButton = () => {
  return (
    <LogHideButtonStyle className="log-hide-button-section">
      <HideBtn className="log-hide-button" />
    </LogHideButtonStyle>
  );
};

export default LogHideButton;
