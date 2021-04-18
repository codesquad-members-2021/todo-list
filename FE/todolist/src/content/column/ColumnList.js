import { useEffect, useState } from 'react';
import styled from 'styled-components'
import Column from './Column'
import { initFetchData } from '../httpUtils'

const ContentStyle = styled.div`
    padding: 0 50px;
    .column__list {
        display: flex;
    }
`

const ColumnList = ({setSidebarLog}) => {
    const [columnsData, setColumnsData] = useState([]);
    useEffect(() => { initFetchData(setColumnsData, "/projects", "columns") }, [])

    return (
        <ContentStyle>
        <ul className="column__list">
            {columnsData.map(column => <Column key={column.id} initialColumn={column} setSidebarLog={setSidebarLog} />)}
        </ul>
        </ContentStyle>
    )
}
export default ColumnList;