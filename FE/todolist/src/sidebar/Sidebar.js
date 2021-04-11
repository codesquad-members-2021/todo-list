import React from 'react';
import styled from 'styled-components';
import Icon from '../utilComponent/Icon';
import Note from './note/Note';

//transform: scale(0) & scale(1)로 사이드바 토글 효과 넣기
const SidebarStyle = styled.aside`
    .sidebar {
        width: 20vw;
        height: 100vh;
        background-color: #fff;
        padding: 2rem;
        float: right;
        /* transform: scale(0); */
    }
`;

const IconBox = styled.div`
    float: right;
    height: 20px;
`;


const Sidebar = () => {
    return (
        <SidebarStyle>
            <aside className="sidebar">
            <IconBox>
                <Icon type={"close"}/>
            </IconBox>
            <Note/>
            </aside>
        </SidebarStyle>
    )
}

export default Sidebar;
