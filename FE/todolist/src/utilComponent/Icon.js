import styled from 'styled-components'

// #BDBDBD #0075DE #FF4343
const IconButton = styled.div`
    height: 15px;
    width: 15px;
    cursor: pointer;
    svg{
        display: block;
    }
    &:hover path {
        fill: ${({type}) => { switch(type) {
                case "plus": return "#0075DE"
                case "close": return "#FF4343"
            }}
        }
    }
    path {
        fill: ${({type}) => type === 'bars' ? '#222' : '#BDBDBD'};
    }
`

const PlusIcon = ({ type }) => {
    return (
        <IconButton type={ type }>
            <svg width="13" height="13" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0.105709 7.53033L0.105709 6.46967H6.46967V0.105713H7.53033V6.46967H13.8943V7.53033H7.53033V13.8943H6.46967V7.53033H0.105709Z" fill="black"/>
            </svg>
        </IconButton>
    )
}

const CloseIcon = ({type, handleClick }) => {
    return (
        <IconButton type={type} onClick={handleClick}>
            <svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M1.5 11.25L0.75 10.5L5.25 6L0.75 1.5L1.5 0.75L6 5.25L10.5 0.75L11.25 1.5L6.75 6L11.25 10.5L10.5 11.25L6 6.75L1.5 11.25Z" fill="black"/>
            </svg>
        </IconButton>
    )
}

const BarsIcon = ({ type, handleClick }) => {
    return (
        <IconButton type={ type } onClick={handleClick}>
            <svg width="17" height="11" viewBox="0 0 17 11" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 1V0H17V1H0ZM17 5V6H0V5H17ZM0 10H17V11H0V10Z" fill="black"/>
            </svg>
        </IconButton>
    )
}

const Icon = ({ type, handleClick }) => {
    return {
        plus: <PlusIcon type={ type }/>,
        close: <CloseIcon type={ type } handleClick={handleClick}/>,
        bars: <BarsIcon type={ type } handleClick={handleClick}/>
    }[type];
}

export default Icon;