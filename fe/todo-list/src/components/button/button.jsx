import React from 'react';
import styled from 'styled-components';

const CancelButton = ({ name }) => {
  return <NormalButton>{name}</NormalButton>;
};

const DeleteButton = ({ name }) => {
  return <NormalButton>{name}</NormalButton>;
};

const SubmitButton = ({ name }) => {
  return <AccentButton>{name}</AccentButton>;
};

const EditButton = ({ name }) => {
  return <AccentButton>{name}</AccentButton>;
};

const Button = ({ type, name }) => {
  return {
    cancel: <CancelButton name={name} />,
    delete: <DeleteButton name={name} />,
    submit: <SubmitButton name={name} />,
    edit: <EditButton name={name} />,
  }[type];
};

export default Button;

const NormalButton = styled.button`
  align-items: flex-start;
  padding: 10px;
  width: 134px;
  height: 40px;
  background: #e0e0e0;
  color: #828282;
  border-radius: 6px;
  border: none;
`;

const AccentButton = styled.button`
  align-items: flex-start;
  padding: 10px;
  width: 134px;
  height: 40px;
  background: #0075de;
  color: #fff;
  border-radius: 6px;
  border: none;
`;
