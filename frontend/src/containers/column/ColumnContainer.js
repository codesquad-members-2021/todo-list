import React, { useEffect, useState } from 'react';
import Card from '../../components/main/Card';
import CardInput from '../../components/main/CardInput';
import Column from '../../components/main/Column';

//prettier-ignore
const ColumnContainer = ({ columnId, title, list ,setColumnData }) => {
    const [cardList, setCardList] = useState(list);
    const [renderedList, setRenderedList] = useState();

    useEffect(() => setCardList(() => list), [list])
    useEffect(() => setRenderedList(() => cardList.map(render)), [cardList]);

    const render = (v, index) => {
        v = {...v, index, setCardList, setColumnData}
        return v.isInput 
        ? <li key={index}><CardInput {...v} /></li>
        : <li key={index}><Card {...v} /></li>
    };

    // const plusEvent = () => setCardList(() => [{ isInput: true, title: '', body: '', columnId:columnId }, ...cardList,]);
    const plusEvent = () => {
        setColumnData((data)=>{
            const newData = [...data]
            newData[columnId-1].cards = [{ isInput: true, title: '', body: '', columnId:columnId },...newData[columnId-1].cards]
            return newData
        })
    }

    return (
        <Column title={title} cardList={renderedList} plusEvent={plusEvent} />
    );
};

export default ColumnContainer;
