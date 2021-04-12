import React from 'react';
import styled from 'styled-components';

const NoteTimeStyle = styled.div`
    margin-top: 0.5rem;
    font-size: 0.8rem;
    color: #909090;
`;

const NoteTimeRecord = ({ time }) => {
    const initialTime = `${time}`;
    return (
        <NoteTimeStyle>1분 전</NoteTimeStyle>
    )
}

export default NoteTimeRecord;