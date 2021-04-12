import React from "react";
import Span from "../../atoms/Span";
import SmallButton from "../../atoms/Buttons/SmallButton";
import Image from "../../atoms/Image";
import hamburgerBtn from "../../../images/hamburgerButtonIcon.png";
import styled from "styled-components";

const Div = styled.div`
  display: flex;
  padding: 15px;
  justify-content: space-between;
  place-items: center;
`;

const Header = ({ isOpenActions }) => {
  return (
    <Div>
      <Span _fontSize="45px" _fontWeight="700">To do List</Span>
      <SmallButton onClick={isOpenActions.toggle}>
        <Image src={hamburgerBtn} _width="30px" />
      </SmallButton>
    </Div>
  );
};

export default Header;
