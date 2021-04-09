import React from 'react';
import styled from 'styled-components';
import { ReactComponent as addCardBtn } from './addCardBtn.svg';

const AddCardBtn = styled(addCardBtn)`
  width: 13.79px
  height: 13.79px
`;

const AddCardButton = () => {
  return (
    <div className="add-card-button-section">
      <AddCardBtn className="add-card-button" />
    </div>
  );
};

export default AddCardButton;
