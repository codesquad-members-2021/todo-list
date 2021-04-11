import styled from 'styled-components';

const StaticCardStyle = styled.div`
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  padding: 0px;

  position: static;
  width: 252px;
  height: 76px;
  left: 16px;
  top: 16px;

  border-radius: 8px;

  /* Inside Auto Layout */

  flex: none;
  order: 0;
  flex-grow: 0;
  margin: 0px 0px;
`;

export default StaticCardStyle;
