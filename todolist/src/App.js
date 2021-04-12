import "./App.css";
import styled from "styled-components";
import IconButton from "./components/IconButton";
import TextButton from "./components/TextButton";

const TestBlock = styled.div`
  width: 500px;
  height: 100px;
  background: tan;
`;
const menu = () => {
  console.log("menu!");
};
const del = () => {
  console.log("del!");
};
const add = () => {
  console.log("add!");
};
function App() {
  return (
    <TestBlock>
      <IconButton type="add" cb={add} size="100"></IconButton>
      <IconButton type="delete" cb={del}></IconButton>
      <IconButton type="menu" cb={menu}></IconButton>
      <TextButton.jsx type="submit" cb={menu}></TextButton.jsx>
      <TextButton.jsx type="cancel" cb={menu}></TextButton.jsx>
      <TextButton.jsx type="edit" cb={menu}></TextButton.jsx>
    </TestBlock>
  );
}

export default App;
