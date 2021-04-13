import styled from "styled-components";

const CardButtonSection = styled.div`
  display: flex;
  justify-content: center;
  margin-top: 1em;
`;

const CardButton = styled.button`
  cursor: pointer;
  padding: 10px;
  width: 134px;
  height: 40px;
  background: ${(props) => props.backgroundColor || "#0075de"};
  color: ${(props) => props.fontColor || "#000"};
  border-radius: 6px;
  border: none;
  margin: 0px 4px;
`;

export { CardButtonSection, CardButton };
