import "./App.css";
import { createGlobalStyle } from "styled-components";
import StateProvider from "./components/StateProvider";

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
      <StateProvider />
    </>
  );
}
export default App;
