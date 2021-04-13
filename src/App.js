import { createGlobalStyle } from "styled-components";
import Header from "./Component/Header/Header";
import TodoContainer from "./Component/Todo/TodoContainer";

const GlobalStyle = createGlobalStyle`
  body {
    background-color: #f2f2f2;
  }
  button {
    background-color: transparent;
    border:none;
    cursor: pointer;
  }
  input {
    border: none;
  }
  input:focus {
    outline:none;
  }
  button:focus {
    outline:none;
  }
  * {
    box-sizing: border-box;
    font-family: "DungGeunMo";
  }
`;

function App() {
  return (
    <>
      <GlobalStyle />
      <Header />
      <TodoContainer />
    </>
  );
}

export default App;
