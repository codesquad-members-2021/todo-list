import { useState, useEffect } from 'react';
import axios from 'axios';
import styled from 'styled-components';
import Icon from '../utilComponent/Icon';
import Note from './note/Note';

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

const Sidebar = ({ sidebarRef, sidebarLog, isOpen, setIsOpen }) => {
    const [ noteList, setNoteList ] = useState([]);

    useEffect(() => {
        if(sidebarLog){
            const { title, action, columnName, createDateTime } = sidebarLog;
            const newObj = {
                "beforeStatus": columnName,
                "afterStatus": columnName,
                "title": title,
                "action": action,
                "createDateTime": createDateTime
            }
            setNoteList([ newObj, ...noteList])
        }
    }, [sidebarLog])

    const fetchNoteListData = async() => {
        try {
            const request = '/notes';
            const response = await axios.get(request);
            setNoteList(() => response.data);
        } catch (error) {
            console.log(error);
        }
    }

    useEffect(() => {
        if (isOpen) fetchNoteListData();
    }, [isOpen]);

    const closeSidebar = () => {
        setIsOpen(false);
        const sidebarPage = sidebarRef.current;
        sidebarPage.style.transform = 'translateX(432px)';
    };

    return (
        <SidebarStyle ref={sidebarRef}>
            <IconBox>
                <Icon type={"close"} handleClick={closeSidebar}/>
            </IconBox>
            <Note noteList={noteList} isOpen={isOpen} sidebarLog={sidebarLog}/>
        </SidebarStyle>
    );
};

export default Sidebar;
