import React from 'react';
import styled from 'styled-components';
import NoteProfilePic from './NoteProfilePic';
import NoteAuthor from './NoteAuthor';
import NoteBody from './NoteBody';
import NoteTimeRecord from './NoteTimeRecord';

const NoteStyle = styled.div`
    height: 120px;
    border-radius: 5px;
    background-color: #dff5f7;
    margin: 1.5rem;
`;

const NoteInfoStyle = styled.div`
    height: 80%;
    width: 75%;
    float: right;
    margin-top: 1rem;
    margin-right: 1rem;
`;

const Note = ({ noteList }) => {
    console.log("노트안의 노트리스트", noteList);
    return (
        <ul>
            {noteList.map(({ createDateTime, ...rest }) => (
                <NoteStyle key={rest.id}>
                    <NoteProfilePic />
                    <NoteInfoStyle>
                        <NoteAuthor />
                        <NoteBody noteData={rest}/>
                        <NoteTimeRecord time={createDateTime}/>
                    </NoteInfoStyle>
                </NoteStyle>
            ))}
        </ul>
    )
}

export default Note;