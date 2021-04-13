const todoListService = {
  postTodoList(columnId, newTodo) {
    const todos = this.getTodoList();
    const columnCardList = this.getColumnCards(columnId, todos);
    todos.todoData[columnId].todoCards = {
      ...newTodo,
      ...columnCardList,
    };
    localStorage.setItem("todos", JSON.stringify({ ...todos }));
  },
  updateTodoList(columnId, cardId, newTodo) {
    const todos = this.getTodoList();
    const columnCardList = this.getColumnCards(columnId, todos);
    todos.todoData[columnId].todoCards = {
      ...columnCardList,
      ...newTodo,
    };
    localStorage.setItem("todos", JSON.stringify({ ...todos }));
  },
  deleteTodoList(columnId, cardId) {
    const todos = this.getTodoList();
    delete todos.todoData[columnId].todoCards[cardId];
    localStorage.setItem("todos", JSON.stringify({ ...todos }));
  },
  getTodoList() {
    const db = localStorage.getItem("todos");
    return db ? JSON.parse(db) : datas;
  },
  getColumnCards(columnId, todos) {
    return todos.todoData[columnId].todoCards;
  },
};

export default todoListService;
const datas = {
  author: "kyle",
  todoData: {
    0: {
      id: 0,
      title: "해야할 일",
      todoCards: {},
    },
    1: {
      id: 1,
      title: "하고있는 일",
      todoCards: {},
    },
    2: {
      id: 2,
      title: "끝난 일",
      todoCards: {},
    },
  },
};
