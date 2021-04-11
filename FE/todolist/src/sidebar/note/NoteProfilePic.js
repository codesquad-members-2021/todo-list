import React from 'react';
import styled from 'styled-components';

const ProfileStyle = styled.span`
    display: inline-block;
    margin-top: 1rem;
    height: max-content;
    width: 30px;
    padding: 1rem;
    font-size: 2rem;
`;


const NoteProfilePic = () => {
    return (
        <ProfileStyle>🥳</ProfileStyle>
    )
}

export default NoteProfilePic;