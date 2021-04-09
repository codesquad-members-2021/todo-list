import React, { useState } from "react";
import TodoHeader from "./todoHeader/TodoHeader.jsx";
import TodoMain from "./todoMain/TodoMain.jsx";

const datas = {
  author: "kyle",
  todoData: [
    {
      id: 0,
      title: "해야할 일",
      todoCards: [
        { id: 0, title: "test1", content: "hello1" },
        { id: 1, title: "test2", content: "hello2" },
        { id: 3, title: "test3", content: "hello3" },
      ],
    },
    {
      id: 1,
      title: "하고있는 일",
      todoCards: [
        { id: 0, title: "test4", content: "hello4" },
        { id: 1, title: "test5", content: "hello5" },
        { id: 3, title: "test6", content: "hello6" },
      ],
    },
    {
      id: 2,
      title: "끝난 일",
      todoCards: [
        { id: 0, title: "test7", content: "hello7" },
        { id: 1, title: "test8", content: "hello8" },
        { id: 3, title: "test9", content: "hello9" },
      ],
    },
  ],
};

const TodoTemplate = () => {
  return (
    <>
      <TodoMain datas={datas} />
    </>
  );
};

export default TodoTemplate;
