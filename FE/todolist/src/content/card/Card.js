import styled from 'styled-components'
import Icon from '../../utilComponent/Icon.js'
import { deleteCard } from '../httpUtils'
import { createNote } from '../util'

const CardStyle = styled.div`
    box-sizing: border-box;
    width: 308px;
    padding: 16px;
    margin: 16px 0;
    background: #fff;
    border-radius: 6px;
    position: relative;
    box-shadow: 0px 1px 30px 0px #E0E0E04D;

    input {
        display: block;
        width: 252px;
        margin: 0 0 8px;
        color: #010101;
        outline: none;
        border: none;
        background: #fff;
    }
    .card__title {
        height: 23px;
        font-size: 1rem;
        font-weight: 700;
        line-height: 23px;
    }
    .card__content {
        font-size: 0.87rem;
        line-height: 20px;
    }
    .card__author {
        width: 252px;
        height: 17px;
        line-height: 17px;
        font-size: 0.75rem;
        color: #bdbdbd;
    }
`
const CardContainer = styled.div`
    position: relative;
`
const IconStyle = styled.div`
    width: 15px;
    position: absolute;
    z-index: 1;
    top: 16px;
    right: 16px;
    &:hover + div {
        background: #FFEEEC;
        border: 1px solid #FF4343;
        padding: 15px;
        input {
            background: #FFEEEC;
        }
    }
`

const Card = ({cardData, columnData, setColumnData, setSidebarLog}) => {
    const removeCard = () => {
        const newCardList = columnData.cardList.filter(v => v.id !== cardData.id)
        setColumnData({ ...columnData, cardList : newCardList})
        deleteCard(`/columns/${columnData.id}/cards/${cardData.id}`)
        const note = createNote(cardData.title, "DELETE", columnData.name)
        setSidebarLog(note)
    }

    return(
        <CardContainer>
            <IconStyle onClick={removeCard}>
                <Icon type= { "close" } />
            </IconStyle>
            <CardStyle>
                <input className="card__title" disabled value={cardData.title} />
                <input className="card__content" disabled value={cardData.content} />
                <div className="card__author"><span>author by {cardData.author}</span></div>
            </CardStyle>
        </CardContainer>
    )
}

export default Card;