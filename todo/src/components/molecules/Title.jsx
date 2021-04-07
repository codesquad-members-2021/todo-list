import React from "react";
import Span from "../atoms/Span";
import SmallButton from "../atoms/Buttons/SmallButton";
import Image from "../atoms/Image";
import styled from "styled-components"
import hamburgerBtn from "../../images/hamburgerButtonIcon.png"

const Div = styled.div`
  display: flex;
  justify-content: space-between;
  padding:15px;
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
      <Span>To do List</Span>
      <SmallButton onClick={clickHandler} >
        <Image src={hamburgerBtn} width="20px" />
      </SmallButton>
    </Div>
  );
};




export default Title;
