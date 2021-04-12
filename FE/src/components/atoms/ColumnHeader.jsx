import styled from 'styled-components';

const Title = styled.h2`
  font-family: Noto Sans KR;
  font-style: normal;
  font-weight: bold;
  font-size: 18px;
  line-height: 26px;
`;

const Span = styled.span`
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: Noto Sans KR;
  font-style: bold;
  font-size: 14px;
  vertical-align: Center;
  height: 26px;
  width: 26px;
`;

const Icon = styled.div`
  background: #bdbdbd;
  height: 26px;
  width: 26px;
  left: 122px;
  top: 0px;
  border-radius: 20px;
`;

export const ColumnTitle = ({ children }) => {
  return <Title>{children}</Title>;
};

export const ColumnIcon = ({ children }) => {
  return (
    <Icon>
      <Span>{children}</Span>
    </Icon>
  );
};
