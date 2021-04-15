import { useRef, useState } from 'react';
import styled from 'styled-components'
import FormInput from './FormInput'
import FormButton from './FormButton'
import postForm from './postForm'
// import Icon from '../../utilComponent/Icon.js'

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

const Form = ({ setIsAddBtnClicked, columnData, setColumnData, setSidebarLog }) => {
    const [newTodo, setNewTodo] = useState({title: '', content: ''})

    const resetInputState = () => {
        FormInputTitle.current.value = ''
        FormInputContent.current.value = ''
    }
    const onChange = ({target}) => setNewTodo({ ...newTodo, [target.name]: target.value })
 
    const setInputState = () => {
        const newCard = {...newTodo, author: 'web'}
        setIsAddBtnClicked(false)
        setColumnData({ ...columnData, cardList : [...columnData.cardList, newCard]})
        postForm(newCard, `/columns/${columnData.id}/cards`)
        setSidebarLog({title: newTodo.title, action: "CREATE", columnName:columnData.name, createDateTime: new Date()})
    }

    const FormInputTitle = useRef()
    const FormInputContent = useRef()

    return (
        <FormStyle>
            <FormInput onChange={onChange} FormInputTitle={FormInputTitle} FormInputContent={FormInputContent}/>
            <FormButton resetInputState={resetInputState} setInputState={setInputState} />
        </FormStyle>
    )
}
export default Form;