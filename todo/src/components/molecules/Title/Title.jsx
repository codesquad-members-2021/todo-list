import React from "react";
import Span from "../../atoms/Span/Span";
import SmallButton from "../../atoms/Buttons/SmallButton";
import Image from "../../atoms/Image/Image";
import styled from "styled-components"
import hamburgerBtn from "../../../images/hamburgerButtonIcon.png";

const Div = styled.div`
  display: flex;
  padding: 15px;
  justify-content: space-between;
  place-items: center;
`;

const Title = () => {
  const clickHandler = () => {
    console.log("success");
  }
  // const changeHandler = () => {
  //   console.log("change");
  // }

  return (
    <Div>
      <Span fontSize="45px" fontWeight="700">To do List</Span>
      <SmallButton onClick={clickHandler} >
        <Image src={hamburgerBtn} imgWidth="30px" />
      </SmallButton>
    </Div>
  );
};

export default Title;