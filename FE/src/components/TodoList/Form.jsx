
import {useRef} from 'react'

const Form = ({addCard, column, handleClickCancel}) => {
    const titleInput = useRef();
    const contentInput = useRef();
    const nextID = useRef(5); // 임시 아이디
    const handleSubmit = (e) => {
        e.preventDefault();
        const newCard = {
            id: nextID.current,
            title: titleInput.current.value,
            content: contentInput.current.value,
            author: column.cards.author
        }
        const cardAdded = [...column.cards, newCard];
        column.cards = cardAdded;
        nextID.current++;
        addCard(column)
    }

    const NewForm = () => (
    <form onSubmit={handleSubmit}>
    <input 
        name="title" 
        type="text" 
        placeholder="제목을 적어주세요" 
        ref={titleInput} 
        autoComplete="off"></input>
    <input 
        name="content" 
        type="text" 
        placeholder="내용을 적어주세요" 
        ref={contentInput} 
        autoComplete="off"></input>
    <div>
    <button>등록</button>
    <button onClick={handleClickCancel}>취소</button>
    </div> 
    </form>);
    return (
        <NewForm/>
    )
}

export default Form
