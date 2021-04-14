import styled from 'styled-components'
import ColumnTitle from './ColumnTitle'
import Card from '../card/Card'

const ColumnStyle = styled.div`
    width: 308px;
    margin-right: 16px;
`

const Column = ({columnData}) => {
    return (
        <div>
            <ColumnStyle>
                <ColumnTitle columnData={columnData} />
                {columnData.cardList.map(card => <Card key={card.id} data={card} />)}
                {/* <Form /> */}
            </ColumnStyle>
        </div>
    )
}

export default Column