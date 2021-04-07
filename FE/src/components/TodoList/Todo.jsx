import React from 'react';
import Card from 'atoms/Card';

const Todo = ({todos}) => {
    if(!todos) return;
    const todoLists = todos.filter((todo) => todo.column.curr  === 'ToDo');
    const card = todoLists.map((list) => <Card key={list.id} list={list}/>)
    return (
    <div>
        {card}
    </div>
  );
}

export default Todo;