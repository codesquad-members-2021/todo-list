const todoListService = {
  postTodoList: (todoList, id) => {
    const db = localStorage.getItem("database"); // 서버 요청
    const database = JSON.parse(db);
    if (id || id === 0) {
      database.todoList.todoData[id].todoCards = {
        ...todoList,
      };
      localStorage.setItem(
        "database",
        JSON.stringify({
          ...database,
        })
      );
    } else {
      localStorage.setItem(
        "database",
        JSON.stringify({
          ...database,
          todoList,
        })
      );
    }
  },
  getTodoList() {
    const db = localStorage.getItem("database"); // 서버 요청
    const { todoList } = JSON.parse(db);
    return todoList;
  },
};

export default todoListService;
