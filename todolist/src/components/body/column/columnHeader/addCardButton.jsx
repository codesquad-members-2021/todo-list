import React from 'react';
import styled from 'styled-components';
import { ReactComponent as addCardBtn } from '../../../style/addIcon.svg';

const AddCardBtn = styled(addCardBtn)`
  width: 13.79px;
  height: 13.79px;

  flex: none;
  order: 1;
  flex-grow: 0;
  margin: 0px 8px;
  cursor: pointer;

  path {
    fill: #bdbdbd;
  }

  &:hover {
    path {
      fill: #0075de;
    }
  }
`;

const AddCardButton = () => {
  return (
    <div className="add-card-button-section">
      <AddCardBtn className="add-card-button" />
    </div>
  );
};

export default AddCardButton;
