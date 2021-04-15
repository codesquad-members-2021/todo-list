import styled from "styled-components";

const HighLightSpan = styled.span`
  font-weight:700;
`;

const historyTemplate = {
  '등록'({ prevColumn, currentTitle }) {
    return (<><HighLightSpan>{prevColumn}</HighLightSpan>에
      {' '}<HighLightSpan>{currentTitle}</HighLightSpan>(을)를
      {' '}<HighLightSpan>등록</HighLightSpan>하였습니다</>);
  },
  '수정'({ prevColumn, prevTitle, currentTitle }) {
    return (<><HighLightSpan>{prevColumn}</HighLightSpan>에
      {' '}<HighLightSpan>{prevTitle}</HighLightSpan>(을)를
      {' '}<HighLightSpan>{currentTitle}</HighLightSpan>(으)로
      {' '}<HighLightSpan>수정</HighLightSpan>하였습니다</>);
  },
  '삭제'({ prevColumn, prevTitle }) {
    return (<><HighLightSpan>{prevColumn}</HighLightSpan>에서
      {' '}<HighLightSpan>{prevTitle}</HighLightSpan>(을)를
      {' '}<HighLightSpan>삭제</HighLightSpan>하였습니다</>);
  },
  '이동'({ prevColumn, currentColumn, prevTitle }) {
    return (<><HighLightSpan>{prevTitle}</HighLightSpan>를
      {' '}<HighLightSpan>{prevColumn}</HighLightSpan>에서
      {' '}<HighLightSpan>{currentColumn}</HighLightSpan>에
      {' '}<HighLightSpan>이동</HighLightSpan>하였습니다</>);
  }
};

export default historyTemplate;