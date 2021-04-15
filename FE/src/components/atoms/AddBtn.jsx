import React from 'react';
import styled from 'styled-components';

const AddBtn = () => {
  return (
    <BtnContainer>
      <svg
        width="72"
        height="74"
        viewBox="0 0 72 74"
        fill="#0075DE"
        xmlns="http://www.w3.org/2000/svg"
      >
        {/* <g filter="url(#filter0_bdd)"> */}
        <circle cx="36" cy="36" r="32" fill="#0075DE" />
        {/* </g> */}
        <defs>
          {/* <filter id="filter0_bdd" x="0" y="0" width="72" height="74" filterUnits="userSpaceOnUse" colorInterpolationFilters="sRGB"> */}
          <feFlood floodOpacity="0" result="BackgroundImageFix" />
          <feGaussianBlur in="BackgroundImage" stdDeviation="2" />
          <feComposite
            in2="SourceAlpha"
            operator="in"
            result="effect1_backgroundBlur"
          />
          <feColorMatrix
            in="SourceAlpha"
            type="matrix"
            values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
          />
          <feOffset dy="2" />
          <feGaussianBlur stdDeviation="2" />
          <feColorMatrix
            type="matrix"
            values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"
          />
          <feBlend
            mode="normal"
            in2="effect1_backgroundBlur"
            result="effect2_dropShadow"
          />
          <feColorMatrix
            in="SourceAlpha"
            type="matrix"
            values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
          />
          <feOffset />
          <feGaussianBlur stdDeviation="2" />
          <feColorMatrix
            type="matrix"
            values="0 0 0 0 0.8 0 0 0 0 0.8 0 0 0 0 0.8 0 0 0 0.5 0"
          />
          <feBlend
            mode="normal"
            in2="effect2_dropShadow"
            result="effect3_dropShadow"
          />
          <feBlend
            mode="normal"
            in="SourceGraphic"
            in2="effect3_dropShadow"
            result="shape"
          />
          {/* </filter> */}
        </defs>
      </svg>

      <svg
        className="plus"
        width="24"
        height="24"
        viewBox="0 0 24 24"
        fill="#FFFFFF"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          d="M0.509766 12.8839L0.509766 11.1161H11.1164V0.509521H12.8841V11.1161H23.4907V12.8839H12.8841V23.4905H11.1164V12.8839H0.509766Z"
          fill="white"
        />
      </svg>
    </BtnContainer>
  );
};

export default AddBtn;

const BtnWrap = styled.div`
  position: absolute;
  left: 1400px;
  top: 800px;
  display: flex;
  align-items: center;
  cursor: pointer;

  .plus {
    position: relative;
    left: -3rem;
  }
`;

const BtnContainer = ({ children }) => <BtnWrap>{children}</BtnWrap>;
