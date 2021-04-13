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


const Sidebar = (props) => {
    const [ noteList, setNoteList ] = useState([]);

    useEffect(() => console.log("사이드바 렌더링 됌!"), []);

    const fetchNoteListData = async() => {
        try {
            const request = '/notes';
            const response = await axios.get(request);
            setNoteList(response);
            console.log(response);
        } catch (error) {
            console.log(error);
        }
    }
    //Sidebar가 렌더링 될 때마다 실행되어야 하는 작업들을 가짐.
    useEffect(() => {
        fetchNoteListData();
    }, []);

    const closeSidebar = () => {
        const sidebarPage = props.sidebarRef.current;
        sidebarPage.style.transform = 'translateX(432px)';
    };

    return (
        <SidebarStyle ref={props.sidebarRef}>
            <IconBox>
                <Icon type={"close"} handleClick={closeSidebar}/>
            </IconBox>
            <Note/>
        </SidebarStyle>
    );
};

export default Sidebar;
