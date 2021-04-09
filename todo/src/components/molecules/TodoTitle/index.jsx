import React from 'react'
import styled from "styled-components";
import Span from '../../atoms/Span';
import Label from '../../atoms/Label';
import SmallButton from '../../atoms/SmallButton';
import Image from '../../atoms/Image';
import hamburgerBtn from "../../../images/hamburgerButtonIcon.png";
// import ButtonList from '../ButtonList';

const WrapDiv = styled.div`
  display: flex;
  padding: 15px;
  justify-content: space-between;
  place-items: center;
`;

const LeftDiv = styled.div`
  display:flex;
  place-items: center;
`;

const TodoTitle = ({ children, ...props }) => (
  <WrapDiv>
    <LeftDiv>
      <Span _fontSize="20px" _fontWeight="700">{children}</Span>
      <Label></Label>
    </LeftDiv>
    <div>
      <SmallButton>
        <Image src={hamburgerBtn} _width="30px" />
      </SmallButton>
    </div>
  </WrapDiv>
);

export default TodoTitle;
