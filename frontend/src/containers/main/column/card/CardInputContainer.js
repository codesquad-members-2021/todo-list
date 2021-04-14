import React, { useState } from 'react';
import axios from 'axios';
import CardInput from "../../../../components/main/column/card/CardInput";

const CardInputContainer = ({ title, body, index, setCardList, columnId, cardId, previousCardId }) => {
    const [inputTitle, setTitle] = useState(title);
    const [inputBody, setBody] = useState(body);
    const isAble = inputTitle.length * inputBody.length;

    const addCard = async () => {
        if (!isAble) return;
        const json = title.length * body.length
            ? await axios.put(`api/columns/${columnId}/cards/${cardId}`, {card: { title: inputTitle, body:inputBody, columnId, cardId, previousCardId}})
            : await axios.post(`api/columns/${columnId}/cards/`, {card: { title: inputTitle, body:inputBody}})

        setCardList((cardList) => {
            const left = cardList.slice(0, index);
            const right = cardList.slice(index + 1);
            return left.concat(json.data.card, right);
        });
    };

    const deleteCard = () => setCardList((cardList) => cardList.filter((_, i) => i !== index));
    const changeTitle = ({ target }) => setTitle(() => target.value);
    const changeBody = ({ target }) => setBody(() => target.value);

    const data = { title, body, inputTitle, inputBody, isAble };
    const onEvents = {
        addCard, deleteCard, changeTitle, changeBody
    };

    return (<CardInput data={data} onEvents={onEvents} />)
};

export default CardInputContainer;