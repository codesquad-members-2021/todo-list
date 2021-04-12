import "./App.css";
import styled from "styled-components";
import TemplateHead from "./components/Templates/TemplateHead";
import { createGlobalStyle } from "styled-components";
const GlobalStyle = createGlobalStyle`
  body{
    background: #e9ecef;
    margin-left: 100px;
    margin-right: 100px;
    font-family: Noto Sans KR;
    font-style: normal;
  }
`;
function App() {
  return (
    <>
      <GlobalStyle />
      <NavBar />
    </>
  );
}

export default App;
