import React from 'react';
import styled from 'styled-components';
import { ReactComponent as deleteColumnBtn } from './deleteColumnBtn.svg';

const DeleteColumnBtn = styled(deleteColumnBtn)`
  width: 13.79px
  height: 13.79px
`;

const DeleteColumnButton = () => {
  return (
    <div className="delete-column-button-section">
      <DeleteColumnBtn className="delete-column-button" />
    </div>
  );
};

export default DeleteColumnButton;
