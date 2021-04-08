import React from "react";
import Span from "../../atoms/Span";
import SmallButton from "../../atoms/SmallButton";
import Image from "../../atoms/Image";
import hamburgerBtn from "../../../images/hamburgerButtonIcon.png";
import styled from "styled-components";

const Div = styled.div`
  display: flex;
  padding: 15px;
  justify-content: space-between;
  place-items: center;
`;

const Header = () => {
  const clickHandler = () => {
    console.log("success");
  }

  return (
    <Div>
      <Span fontSize="45px" fontWeight="700">To do List</Span>
      <SmallButton onClick={clickHandler}>
        <Image src={hamburgerBtn} imgWidth="30px" />
      </SmallButton>
    </Div>
  );
};

export default Header;