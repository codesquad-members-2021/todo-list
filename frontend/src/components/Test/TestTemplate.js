import React from "react";
import styled from "styled-components";

const TestWrapper = styled.div`
    width: 1440px;
    margin: 0 auto;
    border: 1px solid #121212;
    height: 200px;
`;

const TestTemplate = (props) => {
    const { onClick, count } = props;

    return (
        <TestWrapper>
            <div style={{color: "red", fontSize: "20px"}}>{count}</div>
            <button onClick={onClick}>눌러!!</button>
        </TestWrapper>
    )
};

export default  TestTemplate;