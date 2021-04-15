import styled from 'styled-components'
import Icon from '../../utilComponent/Icon.js'

const CardStyle = styled.div`
    box-sizing: border-box;
    width: 308px;
    padding: 16px;
    margin: 16px 0;
    background: #fff;
    border-radius: 6px;
    position: relative;

    input {
        display: block;
        width: 252px;
        margin: 0 0 8px;
        color: #010101;
        outline: none;
        border: none;
        background: #fff;
    }
    input[type="text"] {
        height: 23px;
        font-size: 1rem;
        font-weight: 700;
        line-height: 23px;
    }
    input[type="textarea"] {
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

const Card = ({data}) => {
    return(
        <CardContainer>
            <IconStyle>
                <Icon type= { "close" } />
            </IconStyle>
            <CardStyle>
                <input type="text" disabled value={data.title} />
                <input type="textarea " disabled value={data.content} />
                <div className="card__author"><span>author by {data.author}</span></div>
            </CardStyle>
        </CardContainer>
    )
}

export default Card;