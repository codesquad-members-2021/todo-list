import React from "react";
import Span from "../../atoms/Span";
import SmallButton from "../../atoms/SmallButton";
import Image from "../../atoms/Image";
import styled from "styled-components";
import hamburgerBtn from "../../../images/hamburgerButtonIcon.png";

const Div = styled.div`
  display: flex;
  padding: 15px;
  justify-content: space-between;
  place-items: center;
`;

const Title = ({children, ...props}) => {
  // const clickHandler = () => {
  //   console.log("success");
  // }
  // const changeHandler = () => {
  //   console.log("change");
  // }

  return (
    <Div>
      <div>
        <Span fontSize="45px" fontWeight="700">To do List</Span>
      </div>

      <div>
        <SmallButton>
          <Image src={hamburgerBtn} imgWidth="30px" />
        </SmallButton>

      </div>
    </Div>
  );
};

export default Title;