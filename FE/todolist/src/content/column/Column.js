import { useState } from 'react'
import styled from 'styled-components'
import ColumnTitle from './ColumnTitle'
import Form from '../card/Form'
import Card from '../card/Card'

const ColumnStyle = styled.div`
    width: 308px;
    margin-right: 16px;
`

const Column = ({ initialColumn, setSidebarLog }) => {
    const [isAddBtnClicked, setIsAddBtnClicked] = useState(false)
    const [columnData, setColumnData] = useState(initialColumn)
    const handleClickAddBtn = ({target}) => {
        if(target.closest('div[type="plus"]')) setIsAddBtnClicked(!isAddBtnClicked)
    }
    
    return (
        <div>
            <ColumnStyle>
                <ColumnTitle columnData={columnData} handleClickAddBtn={handleClickAddBtn}/>
                {isAddBtnClicked && 
                    <Form 
                        setIsAddBtnClicked={setIsAddBtnClicked} 
                        columnData={columnData} 
                        setColumnData={setColumnData} 
                        setSidebarLog={setSidebarLog} 
                    />}
                {[...columnData.cardList].reverse().map(card => 
                    <Card key={card.id}
                        cardData={card} 
                        columnData={columnData} 
                        setColumnData={setColumnData} 
                        setSidebarLog={setSidebarLog}
                    />)}
            </ColumnStyle>
        </div>
    )
}

export default Column