import { css } from "styled-components";
import { MdAdd } from "react-icons/md";
import { HiX, HiMenu } from "react-icons/hi";

export const URL = {
  setDB: "http://localhost:3000/todolist-database",
  getDB: "http://localhost:3000/todolist",
};

export const palette = {
  lightGray: "#e0e0e0",
  blue: "#0075de",
  lightRed: "#ffeeec",
  lightRedBorder: "#ffa19f",
};

const TEXT_DEFAULT = `
    width: 134px;
    height: 40px;
    border-radius: 6px;
    margin: 0px 4px;`;

export const BUTTON_STYLE = {
  cancel: css`
    ${TEXT_DEFAULT}
    background: ${palette.lightGray};
    color: black;
  `,
  enroll: css`
    ${TEXT_DEFAULT}
    background: ${palette.blue};
    color: white;
  `,
  edit: css`
    ${TEXT_DEFAULT}
    background: ${palette.blue};
    color: white;
  `,
  remove: css`
    ${TEXT_DEFAULT}
    background: ${palette.blue};
    color: white;
  `,
  bigSize: css`
    width: 60px;
    height: 60px;
    border-radius: 30px;
    font-size: 60px;
    border: 30px;
    background: ${palette.blue};
    color: white;
  `,
  navBtn: css`
    width: 35px;
    height: 35px;
  `,
};

export const BUTTON_TYPE = {
  add: <MdAdd />,
  delete: <HiX />,
  menu: <HiMenu />,
  cancel: "취소",
  enroll: "등록",
  edit: "수정",
  remove: "삭제",
};
