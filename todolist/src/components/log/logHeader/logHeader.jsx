import React from 'react';
import LogTitle from './logTitle.jsx';
import LogHeaderStyle from './logHeader.style.jsx';
import LogHideButton from './logHideButton.jsx';

const LogHeader = () => {
  return (
    <LogHeaderStyle className="log-header-section">
      {/* <LogTitle /> */}
      <LogHideButton /> 
    </LogHeaderStyle>
  );
};

export default LogHeader;
