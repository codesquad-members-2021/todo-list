import { useState } from 'react'
import styled from 'styled-components'
import ColumnTitle from './ColumnTitle'
import Form from '../card/Form'
import Card from '../card/Card'

const ColumnStyle = styled.div`
    width: 308px;
    margin-right: 16px;
`

const Column = ({columnData}) => {
    const [addClicked, setAddClicked] = useState(false)

    return (
        <div>
            <ColumnStyle>
                <ColumnTitle columnData={columnData} addClicked={addClicked} setAddClicked={setAddClicked}/>
                {addClicked && <Form setAddClicked={setAddClicked} />}
                {columnData.cardList.map(card => <Card key={card.id} data={card} />)}
            </ColumnStyle>
        </div>
    )
}

export default Column