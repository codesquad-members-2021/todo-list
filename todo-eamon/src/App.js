import React, { useRef, useState } from "react";
// import Hello from "./Hello";
// import Counter from "./Counter";
// import InputSample from "./inputSample";
// import UserList from './UserList';
// import CreateUser from './CreateUser';
import TodoTemplate from "./components/TodoTemplate";
import TodoHead from "./components/TodoHead";
function App() {
  return (
    <>
      <TodoTemplate>
        <TodoHead />
      </TodoTemplate>
    </>
  );
}

export default App;
