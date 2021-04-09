import React, {useState} from 'react';
import {ColumnHeader, ColumnContainer} from './columnStyle'
import {ColumnTitle, ColumnIcon} from '../atoms/ColumnHeader'
import Card from '../atoms/Card'


const Column = ({data:{columns}, changeColumns}) => {
    const [initialColumns, setColumn] = useState(columns);

    // const toggleCard = () => {

    // }

    const columnLists = initialColumns.map(({id, title, cards}) => (
        <div key={id}>
        <span>{title}</span>
        <span>{cards.length}개</span>
        <div>{cards[0].title, cards[0].content}</div>
        <button><i className="fas fa-plus"></i></button>
        <button><i className="fas fa-times"></i></button>
        </div>

// <Card change={change} />
))

    return (
        <ColumnContainer>
        {columnLists}
        </ColumnContainer>
    )
}

export default Column
