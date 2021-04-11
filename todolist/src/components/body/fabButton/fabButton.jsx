import React from 'react';
import styled from 'styled-components';
import { ReactComponent as FabBtn } from './fabButton.svg';

const Button = styled(FabBtn)`
  width: 64px;
  height: 64px;
`;

const FabButton = () => {
  return <Button className="fab-button-section">hi</Button>;
};

export default FabButton;
