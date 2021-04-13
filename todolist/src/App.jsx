import "./App.css";
import { createGlobalStyle } from "styled-components";
import NavBar from "./components/navBar/NavBar";
import { Column } from "./components/card/CardList.jsx";
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
      <Column />
    </>
  );
}
export default App;
