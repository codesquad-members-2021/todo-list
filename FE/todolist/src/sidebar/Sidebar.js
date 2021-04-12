import React, { useRef }from 'react';
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
`;

const IconBox = styled.div`
    float: right;
    height: 20px;
`;


const Sidebar = (props) => {

    const closeSidebar = () => {
        const sidebarPage = props.sidebarRef.current;
        sidebarPage.style.transform = 'translateX(432px)';
    }

    return (
        <SidebarStyle ref={props.sidebarRef}>
            <IconBox>
                <Icon type={"close"} handleClick={closeSidebar}/>
            </IconBox>
            <Note/>
        </SidebarStyle>
    )
}

export default Sidebar;
