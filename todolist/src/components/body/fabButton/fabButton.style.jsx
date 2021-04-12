import styled from 'styled-components';
import { ReactComponent as addIcon } from '../../style/addIcon.svg';

const AddIcon = styled(addIcon)`
  width: 22.98px;
  height: 22.98px;

  path {
    fill: #ffffff;
  }
`;

const Button = styled.div`
  width: 64px;
  height: 64px;

  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  bottom: 120px;
  right: 130px;

  background: #0075de;

  box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5), 0px 2px 4px rgba(0, 0, 0, 0.25);
  backdrop-filter: blur(4px);
  border-radius: 35px;
`;

export { AddIcon, Button };
