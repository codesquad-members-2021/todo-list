import React from 'react';
import Column from './components/Seong/Column';

const list = [
    {
        title: '1',
        body: '대충내용',
        author: 'web',
    },
    {
        title: '2',
        body: '대충ㅇㅇㅇㅇㅇㅇㅇㅇㅇ내용',
        author: 'web',
    },
];

const App = () => <Column title="Column title" list={list} />;

export default App;
