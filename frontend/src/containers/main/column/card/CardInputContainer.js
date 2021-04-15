import React, { useState } from 'react';
import axios from 'axios';
import CardInput from "../../../../components/main/column/card/CardInput";

const CardInputContainer = ({ title, body, index, setColumnData, columnId, cardId, previousCardId }) => {
    const [inputTitle, setTitle] = useState(title);
    const [inputBody, setBody] = useState(body);
    const isAble = inputTitle.length * inputBody.length;

    const addCard = async () => {
        if (!isAble) return;
        const json = title.length * body.length
            ? await axios.put(`api/columns/${columnId}/cards/${cardId}`, {card: { title: inputTitle, body:inputBody, columnId, cardId, previousCardId}})
            : await axios.post(`api/columns/${columnId}/cards/`, {card: { title: inputTitle, body:inputBody}})

        setColumnData((data)=>{
            const newData = [...data]
            const left = newData[columnId-1].cards.slice(0, index);
            const right = newData[columnId-1].cards.slice(index + 1);
            newData[columnId-1].cards = left.concat(json.data.card, right);
            return newData
        });
    };

    const deleteCard = () => {
        title.length * body.length
            ? setColumnData((data)=>{
                const newData = [...data]
                const left = newData[columnId-1].cards.slice(0, index);
                const right = newData[columnId-1].cards.slice(index + 1);
                newData[columnId-1].cards = left.concat({ title, body, previousCardId, cardId, columnId }, right);
                return newData
            })
            : setColumnData((data)=>{
                const newData = [...data]
                newData[columnId-1].cards = newData[columnId-1].cards.filter((_, i) => i !== index)
                return newData
            })
    };
    const changeTitle = ({ target }) => setTitle(() => target.value);
    const changeBody = ({ target }) => setBody(() => target.value);

    const data = { title, body, inputTitle, inputBody, isAble };
    const onEvents = {
        addCard, deleteCard, changeTitle, changeBody
    };

    return (<CardInput data={data} onEvents={onEvents} />)
};

export default CardInputContainer;