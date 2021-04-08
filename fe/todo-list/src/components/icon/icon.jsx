import React from 'react';
import styled from 'styled-components';

const AddButton = () => {
  return (
    <IconButton>
      <i className="fas fa-plus"></i>
    </IconButton>
  );
};
const DeleteButton = () => {
  return (
    <IconButton>
      <i className="fas fa-times"></i>
    </IconButton>
  );
};
const UserActionButton = () => {
  return (
    <IconButton>
      <i className="fas fa-bars"></i>
    </IconButton>
  );
};

const Icon = ({ type }) => {
  return {
    add: <AddButton />,
    delete: <DeleteButton />,
    userAction: <UserActionButton />,
  }[type];
};

export default Icon;

const IconButton = styled.button`
  color: #bdbdbd;
  border: none;
  background-color: transparent;
`;
