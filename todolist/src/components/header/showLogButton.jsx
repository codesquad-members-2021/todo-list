import React from 'react';
import styled from 'styled-components';
import { ReactComponent as menuBtn } from './showLogButton.svg';

const MenuBtn = styled(menuBtn)`
  position: absolute;
  width: 24px;
  height: 24px;
  left: 1200px;
  top: 44px;
`;

const ShowLogButton = () => {
  return (
    <div className="show-log-button-section">
      <MenuBtn className="show-log-button" />
    </div>
  );
};

export default ShowLogButton;
