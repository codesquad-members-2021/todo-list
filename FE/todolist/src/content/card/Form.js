import {useEffect, useRef, useState} from 'react';
import styled from 'styled-components'
import CardInput from './CardInput'
import CardButton from './CardButton'
// import Icon from '../../utilComponent/Icon.js'

const FormStyle = styled.div`
    background: #fff;
    box-sizing: border-box;
    width: 308px;
    padding: 16px;
    border-radius: 6px;
    input:disabled {
        background: #fff;
        color: #333;
    }
`

const Form = () => {
    const [inputs, setInputs] = useState({title: '', content: ''})
    const [newTodo, setNewTodo] = useState({title: '', content: ''})

    const resetInputState = () => setInputs({title: '', content: ''})
    const onChange = ({target}) => setNewTodo({ ...newTodo, [target.name]: target.value })
    const setInputState = (e) => {
        e.preventDefault();
        setInputs({ title: newTodo.title, content: newTodo.content })
        contentInput.current.disabled = true;
        titleInput.current.disabled = true;
    }

    const titleInput = useRef();
    const contentInput = useRef();

    useEffect(() => {
        titleInput.current.value = inputs.title;
        contentInput.current.value = inputs.content;
    }, [inputs])

    return (
        <FormStyle>
            <CardInput titleInput={titleInput} contentInput={contentInput} onChange={onChange}/>
            <CardButton resetInputState={resetInputState} setInputState={setInputState} />
        </FormStyle>
    )
}
export default Form;