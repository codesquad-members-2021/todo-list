import { css } from "styled-components";
import { MdMenu, MdAdd } from "react-icons/md";
import { HiX } from "react-icons/hi";
const TEXT_DEFAULT = `
    width: 134px;
    height: 40px;
    border-radius: 6px;
    margin: 0px 4px;`;
    
export const BUTTON_STYLE = {
  cancel: css`
    ${TEXT_DEFAULT}
    background: #e0e0e0;
    color: black;
  `,
  enroll: css`
    ${TEXT_DEFAULT}
    background: #0075de;
    color: white;
  `,
  bigSize: css`
    width: 60px;
    height: 60px;
    border-radius: 30px;
    font-size: 60px;
    border: 30px;
    background: #0075de;
    color: white;
  `,
};
export const BUTTON_TYPE = {
  add: <MdAdd />,
  delete: <HiX />,
  menu: <MdMenu />,
  cancel: "취소",
  enroll: "등록",
};
