import React from 'react';
import styled from 'styled-components';

const AddButton = ({ type }) => {
  return (
    <IconButton type={type}>
      <i className="fas fa-plus"></i>
    </IconButton>
  );
};
const DeleteButton = ({ type }) => {
  return (
    <IconButton type={type}>
      <i className="fas fa-times"></i>
    </IconButton>
  );
};
const UserActionButton = ({ type }) => {
  return (
    <IconButton type={type}>
      <i className="fas fa-bars"></i>
    </IconButton>
  );
};

const Icon = ({ type }) => {
  return {
    add: <AddButton type={type} />,
    delete: <DeleteButton type={type} />,
    userAction: <UserActionButton type={type} />,
  }[type];
};

export default Icon;

const IconButton = styled.button`
  color: ${props => (props.type === 'userAction' ? '#010101' : '#bdbdbd')};
  border: none;
  background-color: transparent;
  outline: none;
  cursor: pointer;
  font-size: 16px;

  &:hover {
    color: ${props => {
      return { add: '#0075DE', delete: '#FF4343' }[props.type] || '#505050';
    }};
  }
`;
