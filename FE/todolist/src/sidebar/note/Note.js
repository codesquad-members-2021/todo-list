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
    display: inline-block;
    height: 80%;
    width: 75%;
    float: right;
    margin-top: 1rem;
    margin-right: 1rem;
`;

const Note = () => {
    return (
        <NoteStyle>
            <NoteProfilePic/>
            <NoteInfoStyle>
                <NoteAuthor/>
                <NoteBody/>
                <NoteTimeRecord value={{ time: "1분"}}/>
            </NoteInfoStyle>
        </NoteStyle>
    )
}

export default Note;