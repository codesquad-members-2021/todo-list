import styled from 'styled-components'

const InputContainer = styled.div`
    margin-bottom: 16px;
    input {
        width: 276px;
        outline: none;
        border: none;
        font-family: Noto Sans KR;
    }
    input:first-child {
        height: 23px;
        line-height: 23px;
        font-weight: bold;
        font-size: 16px;
    }
    input:last-child {
        height: 20px;
        line-height: 20px;
        font-size: 14px;
    }
`
const CardInput = ({titleInput, contentInput, onChange}) => {
    return(
        <InputContainer>
            <form action="">
                <input 
                    type="text"
                    autoComplete = "off"
                    placeholder="제목을 입력하세요" 
                    name="title"
                    ref={titleInput}
                    onChange={onChange}
                />
                <input 
                    type="textarea"
                    autoComplete = "off"
                    placeholder="내용을 입력하세요" 
                    name="content"
                    ref={contentInput}
                    onChange={onChange}
                />
            </form>
        </InputContainer>
        )      
}

export default CardInput;