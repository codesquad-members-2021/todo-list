import React from 'react';
import styled from 'styled-components';
import Header from './Header/Header';
import Activity from './Activity/Activity';

const StyledHeaderTemplate = styled.nav`
    display: flex;
`;

const HeaderTemplate = ({
    title,
    onClickForLogVisible,
    activityHide,
    activityDatas,
}) => (
    <StyledHeaderTemplate>
        <Header
            title={title}
            onClickForLogVisible={onClickForLogVisible}
        />
        <Activity
            activityHide={activityHide}
            activityDatas={activityDatas}
            onClickForLogVisible={onClickForLogVisible}
        />
    </StyledHeaderTemplate>
);

export default HeaderTemplate;
