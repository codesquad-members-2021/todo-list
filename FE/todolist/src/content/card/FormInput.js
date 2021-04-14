import styled from 'styled-components'

const InputContainer = styled.div`
    margin-bottom: 16px;
    input {
        width: 276px;
        outline: none;
        border: none;
        font-family: Noto Sans KR;
    }
    .input__title {
        height: 23px;
        line-height: 23px;
        margin-bottom: 8px;
        font-weight: bold;
        font-size: 16px;
    }
    .input__content {
        height: 20px;
        line-height: 20px;
        font-size: 14px;
    }
`
const FormInput = ({FormInputTitle, FormInputContent, onChange}) => {
    return(
        <InputContainer>
            <form action="">
                <input 
                    className="input__title"
                    autoComplete = "off"
                    placeholder="제목을 입력하세요" 
                    name="title"
                    ref={FormInputTitle}
                    onChange={onChange}
                />
                <input 
                    className="input__content"
                    autoComplete = "off"
                    placeholder="내용을 입력하세요"
                    name="content"
                    ref={FormInputContent}
                    onChange={onChange}
                />
            </form>
        </InputContainer>
        )      
}

export default FormInput;