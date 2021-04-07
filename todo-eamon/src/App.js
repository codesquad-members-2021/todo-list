import React, { useRef, useState } from "react";
// import Hello from "./Hello";
// import Counter from "./Counter";
// import InputSample from "./inputSample";
// import UserList from './UserList';
// import CreateUser from './CreateUser';
import TodoTemplate from "./components/TodoTemplate";
import TodoHead from "./components/TodoHead";
import TodoList from "./components/TodoList";
import TodoCreate from "./components/TodoCreate";
function App() {
  return (
    <>
      <TodoTemplate>
        <TodoHead />
        <TodoList />
        <TodoCreate />
      </TodoTemplate>
    </>
  );
}

export default App;
