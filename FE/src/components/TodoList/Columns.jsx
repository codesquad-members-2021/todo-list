import React, {useState} from 'react';
import {ColumnHeader, ColumnContainer} from './columnStyle'
import {ColumnTitle, ColumnIcon} from '../atoms/ColumnHeader'
import Card from '../atoms/Card'
import Form from './Form'


const Column = ({data:{columns}, changeColumns}) => {
    const [initialColumns, setColumn] = useState(columns);
    // 현재 true값 false값으로 변경해주어야함
    const [isClicked, setIsClicked] = useState(true);
    // const toggleCard = () => {

    // }
    const columnLists = initialColumns.map(({id, title, cards}) => (
        <li key={id}>
        <header>
        <span>{title}</span>
        <span>{cards.length}개</span>
        <button onclick><i className="fas fa-plus"></i></button>
        <button><i className="fas fa-times"></i></button>
        </header>

        <div>
        <Form isClicked={isClicked}/>
        <div>{cards[0].title}</div>
        <div>{cards[0].content}</div>
        {/* <Card cardData /> */}
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
