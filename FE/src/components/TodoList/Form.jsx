import React from 'react'


const Form = ({isClicked, cardList, addCard ,id, toggleForm}) => {
    const addTodo = (e) => {
        e.preventDefault();
    }

    const NewCard = () => (
    <form action="">
    <input type="text" placeholder="제목을 적어주세요"></input>
    <input type="text" placeholder="내용을 적어주세요"></input>
    <div>
    <button onClick={addTodo}>등록</button>
    <button onClick={addTodo}>취소</button>
    </div> 
    </form>);
    return (
        <>
        <NewCard/>
    </>
    )
}

export default Form
