import styled from 'styled-components';

const StyledSvg = styled.svg`
  cursor: pointer;
  .icon-plus {
    &:hover {
      fill: #0075de;
    }
  }

  .icon-cancel:hover {
    fill: #ff4343;
  }
`;

const Icon = ({ type }) => {
  return {
    plus: (
      <StyledSvg
        width="14"
        height="14"
        viewBox="0 0 14 14"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          className="icon-plus"
          d="M0.105713 7.53033L0.105713 6.46967H6.46967V0.105713H7.53033V6.46967H13.8943V7.53033H7.53033V13.8943H6.46967V7.53033H0.105713Z"
          fill="#BDBDBD"
        />
      </StyledSvg>
    ),
    cancel: (
      <StyledSvg
        width="12"
        height="12"
        viewBox="0 0 12 12"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          className="icon-cancel"
          d="M1.5 11.25L0.75 10.5L5.25 6L0.75 1.5L1.5 0.75L6 5.25L10.5 0.75L11.25 1.5L6.75 6L11.25 10.5L10.5 11.25L6 6.75L1.5 11.25Z"
          fill="#BDBDBD"
        />
      </StyledSvg>
    ),
    add: (
      <>
        <svg
          width="72"
          height="74"
          viewBox="0 0 72 74"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          <g filter="url(#filter0_bdd)">
            <circle cx="36" cy="36" r="32" fill="#0075DE" />
          </g>
          <defs>
            <filter
              id="filter0_bdd"
              x="0"
              y="0"
              width="72"
              height="74"
              filterUnits="userSpaceOnUse"
              colorInterpolationFilters="sRGB"
            >
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
            </filter>
          </defs>
        </svg>
      </>
    ),
  }[type];
};

export default Icon;
