import React from 'react';
import styled from 'styled-components';

const IconButton = styled.button`
  color: #bdbdbd;
  border: none;
  background-color: transparent;
`;

function AddButton() {
  return (
    <IconButton>
      <i className="fas fa-plus"></i>
    </IconButton>
  );
}
function DeleteButton() {
  return (
    <IconButton>
      <i className="fas fa-times"></i>
    </IconButton>
  );
}
function UserActionButton() {
  return (
    <IconButton>
      <i className="fas fa-bars"></i>
    </IconButton>
  );
}

function Icon({ type }) {
  return {
    add: <AddButton />,
    delete: <DeleteButton />,
    userAction: <UserActionButton />,
  }[type];
}

export default Icon;
