import styled from 'styled-components'
import Icon from '../../utilComponent/Icon'

const ColumnTitleStyle = styled.div`
    height: 26px;
    margin: 16px 0;
    padding: 0 8px;
    line-height: 30px;
    display: flex;
    position: relative;
    .title__span {
        font-size: 1.1rem;
        font-weight: bold;
    }
    .title__count {
        margin: 0 8px; 
        width: 26px;
        height: 26px;
        background: #bdbdbd;
        text-align: center;
        line-height: 28px;
        border-radius: 50%;
        font-size: 0.8rem;
    }
`
const IconStyle = styled.div`
    width: 46px;
    position: absolute;
    top: 5px;
    right: 8px;
    display: flex;
    justify-content: space-between;
`

const ColumnTitle = ({columnData, handleClickAddBtn}) => {

    return (
        <ColumnTitleStyle>
            <span className="title__span">{columnData.name}</span>
            <div className="title__count">{columnData.cardList.length}</div>
            <IconStyle  onClick={handleClickAddBtn}>
                <Icon type={ "plus" }/>
                <Icon type={ "close" }/>
            </IconStyle>
        </ColumnTitleStyle>
    );
}

export default ColumnTitle