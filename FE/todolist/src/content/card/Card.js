import styled from 'styled-components'
// import Icon from '../../utilComponent/Icon.js'

const CardStyle = styled.div`
    box-sizing: border-box;
    width: 308px;
    padding: 16px;
    margin: 16px 0;
    background: #fff;
    border-radius: 6px;
    box-shadow: 0px 1px 30px 0px #E0E0E0 30%;

    &:hover{
        box-shadow: 0 0 10px rgba(33,33,33,.2);
        transition: 0.3s;
    }

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

const Card = ({data}) => {

    const handleDragStart = (e) => {
        console.log(e);
        console.log(data);
    }

    return(
        <CardStyle draggable onDragStart={handleDragStart}>
            <input 
                type="text"
                disabled
                value={data.title}
            />
            <input
                type="textarea"
                disabled
                value={data.content}
            />
            <div className="card__author"><span>author by {data.author}</span></div>
        </CardStyle>
    )
}

export default Card;