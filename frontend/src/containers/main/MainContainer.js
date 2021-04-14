import React, { useEffect, useState } from 'react';
import axios from 'axios';
import ColumnContainer from './column/ColumnContainer';
import Main from '../../components/main/Main';


//prettier-ignore
const MainContainer = () => {
    const [columnData, setColumnData] = useState([]);
    const [columns, setColumns] = useState();

    useEffect(() => axios.get('/api/columns').then((json) => setColumnData(() => json.data.columns)), []);

    useEffect(() => {
        setColumns(() =>
            columnData.map(({ columnId, name, cards }, i) => (
                <li key={i}><ColumnContainer columnId={columnId} title={name} list={cards}/></li>
            )),
        );
    }, [columnData]);


    return <Main>{columns}</Main>;
};

export default MainContainer;
