import React from 'react';
import styled from 'styled-components';
import Header from './Header/Header';
import Activity from './Activity/Activity';

const StyledTopbarTemplate = styled.nav`
    display: flex;
`;

const TopbarTemplate = ({
    title,
    onClickForLogVisible,
    activityHide,
    activityDatas,
}) => (
    <StyledTopbarTemplate>
        <Header
            title={title}
            onClickForLogVisible={onClickForLogVisible}
        />
        <Activity
            activityHide={activityHide}
            activityDatas={activityDatas}
            onClickForLogVisible={onClickForLogVisible}
        />
    </StyledTopbarTemplate>
);

export default TopbarTemplate;
