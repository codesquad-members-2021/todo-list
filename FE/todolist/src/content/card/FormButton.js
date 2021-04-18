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
    button:last-child {
        background: #86C6FF;
        color:  #fff;
    }
`

const FormButton = ({handleClickCancel, handleClickSave, isEditBtn}) => {
    return(
            <BtnContainer>
                <button onClick={handleClickCancel}>취소</button>
                {isEditBtn 
                    ? <button onClick={handleClickSave}>수정</button>
                    : <button onClick={handleClickSave}>저장</button>
                }
            </BtnContainer>
        )      
}

export default FormButton;