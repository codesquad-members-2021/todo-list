import styled from 'styled-components';

const DivFlex = styled.div`
  display: flex;
`;

const ColumnContainer = ({ children }) => <DivFlex>{children}</DivFlex>;

export { ColumnContainer };
