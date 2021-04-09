import React, {useEffect} from 'react'


const Form = ({isClicked, cards, addCard ,id}) => {
    const addTodo = (e) => {
        e.preventDefault();
    }

  
    
    
    console.log(cards);
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
