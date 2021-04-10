import React from 'react';
import styled from 'styled-components';
import { ReactComponent as FabBtn } from './fabButton.svg';

const Button = styled(FabBtn)`
  width: 64px;
  height: 64px;
`;

const FabButton = () => {
  return (
    <div className="fab-button-section">
      <Button className="fab-button" />
    </div>
  );
};

export default FabButton;
