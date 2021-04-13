import React, { useState, useEffect } from 'react';
import axios from 'axios';
import styled from 'styled-components';
import Icon from '../utilComponent/Icon';
import Note from './note/Note';

//transform: scale(0) & scale(1)로 사이드바 토글 효과 넣기
const SidebarStyle = styled.aside`
        position: absolute;
        box-sizing: border-box;
        top: 0;
        transform: translateX(432px);
        right: 0px;
        width: 432px;
        height: 100vh;
        background-color: #fff;
        padding: 2rem;
        transition: 0.5s;
`;

const IconBox = styled.div`
    float: right;
    height: 20px;
`;

//const noteData = [{note}, {note}, ]

const Sidebar = ({ sidebarRef, open , noteList, setNoteList }) => {
    // const [ noteList, setNoteList ] = useState([]);
    console.log("다시불림", noteList);

    const fetchNoteListData = async() => {
        console.log("fetch")
        try {
            const request = '/notes';
            const response = await axios.get(request);
            setNoteList(() => response.data);
            // console.log(noteList);
        } catch (error) {
            console.log(error);
        }
    }

    useEffect(() => {
        if (open) fetchNoteListData();
    }, [open]);

    const closeSidebar = () => {
        const sidebarPage = sidebarRef.current;
        sidebarPage.style.transform = 'translateX(432px)';
    };

    return (
        <SidebarStyle ref={sidebarRef}>
            <IconBox>
                <Icon type={"close"} handleClick={closeSidebar}/>
            </IconBox>
            <Note noteList={noteList}/>
        </SidebarStyle>
    );
};

export default Sidebar;
