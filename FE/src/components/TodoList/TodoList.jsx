import React, {useState, useEffect} from 'react';
import "./TodoList.css";
import Todo from './Todo';


const TodoList = () => {
    const [todos, setTodos] = useState([]);
    
    useEffect (() => {
        const url = "http://localhost:3000/data.json"
        fetchTodos(url, setTodos);
    }, []);

    const fetchTodos = async (url, setTodos) => {
        const response = await fetch(url);
        const data = await response.json();
        setTodos(data);
    }

    return (
       <>
        <div className="TodoList">
            {/* <Card todos={todos}/> */}
            <Todo todos={todos}/>
            {/* <Progress todos ={status}/> */}
            {/* <done/> */}
        </div>
      </>
    )
}



export default TodoList;