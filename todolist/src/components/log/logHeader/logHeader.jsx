import React from 'react';
import LogTitle from './logTitle.jsx';
import LogHeaderStyle from './logHeader.style.jsx';
import LogHideButton from './logHideButton.jsx';

const LogHeader = ({handleLogRender}) => {
  return (
    <LogHeaderStyle className="log-header-section">
      {/* <LogTitle /> */}
      <LogHideButton handleLogRender={handleLogRender} /> 
    </LogHeaderStyle>
  );
};

export default LogHeader;
