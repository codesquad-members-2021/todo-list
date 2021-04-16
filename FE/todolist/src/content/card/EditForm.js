import { useState } from 'react';
import styled from 'styled-components'
import FormInput from './FormInput'
import FormButton from './FormButton'
import { putCard } from '../httpUtils'
import { createNote } from '../util'

const FormStyle = styled.div`
    background: #fff;
    box-sizing: border-box;
    width: 308px;
    padding: 16px;
    border: 1px solid #0075DE;
    border-radius: 6px;
    input:disabled {
        background: #fff;
        color: #333;
    }
`

const EditForm = ({ cardId, setIsDbClicked, columnData, setColumnData, setSidebarLog }) => {
    const [newTodo, setNewTodo] = useState({title: '', content: ''})

    const cancelEditing = () => { setIsDbClicked(false) }

    const onChange = ({target}) => setNewTodo({ ...newTodo, [target.name]: target.value })
    
    const editCardContent = () => {
        setIsDbClicked(false)
        let newCard = {id: cardId, ...newTodo, author: 'web'}
        putCard(newCard, `/columns/${columnData.id}/cards/${cardId}`)
        setColumnData({...columnData, cardList : getNewCardList(newCard)})
        const note = createNote(newTodo.title, "UPDATE", columnData.name)
        setSidebarLog(note)
    }
    const getNewCardList = (newCard) => {
        return columnData.cardList.map(card => card.id === cardId ? newCard : card)
    }

    return (
        <FormStyle>
            <FormInput onChange={onChange} />
            <FormButton 
                handleClickCancel={cancelEditing} 
                handleClickSave={editCardContent} 
                isEditBtn={true}
            />
        </FormStyle>
    )
}
export default EditForm;