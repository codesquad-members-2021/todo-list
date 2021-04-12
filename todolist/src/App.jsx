import "./App.css";
import styled from "styled-components";
import { createGlobalStyle } from "styled-components";
import NavBar from "./components/NavBar";
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
