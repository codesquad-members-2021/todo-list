import styled from 'styled-components';

const ButtonIcon = styled.button`
  background: transparent;
  outline: 0;
  border: 0;
  cursor: pointer;
  color: #808080;
`;

export const PlusBtn = () => {
  return (
    <ButtonIcon>
      <i className="fas fa-plus"></i>
    </ButtonIcon>
  );
};

export const CancelBtn = () => {
  return (
    <ButtonIcon>
      <i className="fas fa-times"></i>
    </ButtonIcon>
  );
};
