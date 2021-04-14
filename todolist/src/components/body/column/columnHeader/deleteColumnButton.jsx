import React from 'react';
import styled from 'styled-components';
import { ReactComponent as deleteColumnBtn } from '../../../style/deleteIcon.svg';

const DeleteColumnBtn = styled(deleteColumnBtn)`
  width: 13.79px;
  height: 13.79px;

  flex: none;
  order: 2;
  flex-grow: 0;
  margin: 0px 8px;
   cursor: pointer;

  path {
    fill: #bdbdbd;
  }

  &:hover {
    path {
      fill: #FF4343;
    }
`;

const DeleteColumnButton = () => {
  return (
    <div className="delete-column-button-section">
      <DeleteColumnBtn className="delete-column-button" />
    </div>
  );
};

export default DeleteColumnButton;
