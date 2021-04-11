import styled from 'styled-components';

const ColumnHeaderSection = styled.span`
  /* Auto Layout */

  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  padding: 0px 8px;

  width: 308px;
  height: 26px;

  /* Inside Auto Layout */

  flex: none;
  order: 0;
  flex-grow: 0;
  margin: 16px 0px;
`;

export default ColumnHeaderSection;
