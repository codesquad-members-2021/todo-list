import styled from 'styled-components'

const BtnContainer = styled.div`
    width: 276px;
    height: 40px;
    display: flex;
    justify-content: space-between;
    button {
        width: 134px;
        height: 40px;
        border-radius: 6px;
        outline: none;
        border: none;
        background: #E0E0E0;
        color: #828282;
        cursor: pointer;
    }
`

const CardButton = ({resetInputState, setInputState}) => {
    return(
            <BtnContainer>
                <button onClick={resetInputState}>취소</button>
                <button onClick={setInputState}>저장</button>
            </BtnContainer>
        )      
}

export default CardButton;