import React from 'react';
import styled from 'styled-components';
import { ReactComponent as menuBtn } from './showLogButton.svg';

const MenuBtn = styled(menuBtn)`
  width: 17px;
  height: 11px;
`;

const ShowLogButton = () => {
  return (
    <div className="show-log-button-section">
      <MenuBtn className="show-log-button" />
    </div>
  );
};

export default ShowLogButton;
