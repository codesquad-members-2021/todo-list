import React from 'react';
import styled from 'styled-components';
import NoteProfilePic from './NoteProfilePic';
import NoteAuthor from './NoteAuthor';
import NoteBody from './NoteBody';
import NoteTimeRecord from './NoteTimeRecord';

const Note = () => {
    return (
        <>
            <NoteProfilePic/>
            <NoteAuthor/>
            <NoteBody/>
            <NoteTimeRecord/>
        </>
    )
}

export default Note;