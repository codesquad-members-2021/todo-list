import React from 'react';
import Column from './components/Seong/Column';

const list = [
    {
        title: '대충제목',
        body: '대충내용',
        author: 'web',
    },
    {
        title: '제목',
        body: '대충ㅇㅇㅇㅇㅇㅇㅇㅇㅇ내용',
        author: 'web',
    },
];

const list2 = [
    {
        title: '라노짱짱',
        body: '라쿤잘생김',
        author: 'web',
    },
]

const App = () => {
    return (
        <div>
            <Column title="Column title" list={list} />
            <Column title="Column 잘되니?" list={list2} />
        </div>
    );
};

export default App;
