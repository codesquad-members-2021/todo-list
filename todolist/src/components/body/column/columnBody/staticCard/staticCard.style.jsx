import styled from 'styled-components';

const StaticCardStyle = styled.div`
  display: flex;
  align-items: flex-start;
  padding: 16px;
  margin: 7px 0;

  width: 308px;
  height: auto;

  background: #ffffff;

  box-shadow: 0px 1px 30px rgba(224, 224, 224, 0.3);
  border-radius: 6px;

  &.activer {
    background: #ffffff;

    border: 1px solid #0075de;
  }

  &.delete {
    background: #ffeeec;

    border: 1px solid #ff4343;
  }

  &.drag {
    background: rgba(255, 255, 255, 0.8);

    box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5), 0px 2px 4px rgba(0, 0, 0, 0.25);
    backdrop-filter: blur(4px);
  }

  &.place {
    background: #ffffff;
    opacity: 0.4;

    border: 1px solid #0075de;
  }
`;

export default StaticCardStyle;
