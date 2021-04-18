import logService from './logService.js';
import todoListService from './todoListService.js';

const datas = {
  author: 'kyle',
  todoData: {
    0: {
      id: 0,
      title: '해야할 일',
      todoCards: {},
    },
    1: {
      id: 1,
      title: '하고있는 일',
      todoCards: {},
    },
    2: {
      id: 2,
      title: '끝난 일',
      todoCards: {},
    },
  },
};
const initTodo = () => {
  if (!todoListService.getTodoList()) localStorage.setItem('todos', JSON.stringify(datas));
  if (!logService.getLog()) localStorage.setItem('logs', JSON.stringify([]));
};

export default initTodo;
