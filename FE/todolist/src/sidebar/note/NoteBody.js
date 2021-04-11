import React from 'react';
import styled from 'styled-components';

const NoteBodyStyle = styled.div`
    margin-top: 0.5rem;
    font-size: 0.9rem;
`;

const NoteBody = () => {
    const message = `HTML/CSS 공부하기를 해야할 일에서 하고 있는 일로 이동하였습니다.`;
    return (
        <NoteBodyStyle>
            {message}
        </NoteBodyStyle>
    )
}

export default NoteBody;