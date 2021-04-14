import React, { useEffect, useState } from 'react';
import Card from '../../components/main/Card';
import CardInput from '../../components/main/CardInput';
import Column from '../../components/main/Column';

//prettier-ignore
const ColumnContainer = ({ columnId, title, list }) => {
    const [cardList, setCardList] = useState(list);
    const [renderedList, setRenderedList] = useState();

    useEffect(() => setRenderedList(() => cardList.map(render)), [cardList]);

    const render = (v, index) => {
        v = {...v, index, setCardList}
        return v.isInput 
        ? <li key={index}><CardInput {...v} /></li>
        : <li key={index}><Card {...v} /></li>
    };

    const plusEvent = () => setCardList(() => [{ isInput: true, title: '', body: '', columnId:columnId }, ...cardList,]);

    return (
        <Column title={title} cardList={renderedList} plusEvent={plusEvent} />
    );
};

export default ColumnContainer;
