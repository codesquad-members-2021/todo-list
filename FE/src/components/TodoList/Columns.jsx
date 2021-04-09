import React, {useState, useEffect} from 'react';
import {ColumnHeader, ColumnContainer} from './columnStyle'
import {ColumnTitle, ColumnIcon} from '../atoms/ColumnHeader'
import Card from '../atoms/Card'
import Form from './Form'


const Column = ({data:{columns}, changeColumns}) => {
    const [initialColumns, setColumn] = useState(columns);
    const [cardList, setCardList] = useState(columns.cards)
    // 현재 true값 false값으로 변경해주어야함
    // const [isClicked, setIsClicked] = useState(false);
    const [currentID, setCurrentID] = useState(null);
    // const toggleCard = () => {
    // }
   

    // null값인지 값이 들어있는지 확인
    const handleClick = (clickedID) => {
        if(currentID !== clickedID) setCurrentID(clickedID);
        else if(currentID !== null) setCurrentID(null);
        else setCurrentID(clickedID);
        
    };

    const addCard = ({newCard}) => {
        setCardList([...cardList, newCard])
    }

    const columnLists = initialColumns.map(({id, title, cards}) => (
        <li key={id}>
        <header>
        <span>{title}</span>
        <span>{cards.length}개</span>
        <button onClick={() => handleClick(id)}><i className="fas fa-plus"></i></button>
        <button><i className="fas fa-times"></i></button>
        </header>
        <div>
        
        {currentID === id ? <Form key={id} cards={cards} addCard={addCard}/> : <></>}
        {console.log(currentID, id)}
        </div>
        </li>
))

    return (
        <ColumnContainer>
        {columnLists}
        </ColumnContainer>
    )
}

export default Column
