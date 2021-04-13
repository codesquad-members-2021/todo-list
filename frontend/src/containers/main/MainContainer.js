import React, { useState } from "react";
import ColumnContainer from '../column/ColumnContainer';
import Main from "../../components/main/Main";

const MainContainer = () => {
    const [columnData, setColumnData] = useState([
        {
            title: "대충 칼럼 제목 1 (성 천재)",
            list : [
                {
                    title: '라노',
                    body: '리프레시하기',
                    author: 'web',
                },
                {
                    title: '성',
                    body: '닉네임 어떻게하면 자연스럽게 몰래 바꿀지 고민하기',
                    author: 'web',
                },
                {
                    title: '성&라노',
                    body: 'CSSSSSSSSSSSSSSSSS',
                    author: 'web',
                },
            ]
        },
        {
            title: "대충 칼럼 제목 2",
            list : [
                {
                    title: '낙산공원',
                    body: '가고싶다',
                    author: 'web',
                },
                {
                    title: '여의도한강공원에서',
                    body: '치맥 먹고싶다',
                    author: 'web',
                },
            ]
        },
        {
            title: "제목이몇글자면줄바꿈이될까",
            list : [
                {
                    title: '판교가기',
                    body: '내년안에 가야지',
                    author: 'web',
                }
            ]
        }
    ]);

    const [columns, setColumns] = useState(
        columnData.map(({title, list}, i) => <li key={i}><ColumnContainer title={title} list={list} /></li>));

    return (
        <Main>{columns}</Main>
    );
};

export default MainContainer;