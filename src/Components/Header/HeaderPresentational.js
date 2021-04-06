import React from 'react'
import styled from 'styled-components';

function HeaderPresentational() {
  return (
    <>
      <CustomSection>
        나는 프레젠
      </CustomSection>
      <CustomSection>
        나는 프레젠
      </CustomSection>
    </>
  )
}

const CustomSection = styled.section`
  background-color: yellow;
  width: 100%;
  height: 1000px;
`

export default HeaderPresentational
