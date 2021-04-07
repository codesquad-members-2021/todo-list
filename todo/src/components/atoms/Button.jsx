import React from "react";

const Button = ({ children, props }) => {
  return <button onClick={props.onClick}>{children}</button>;
};

export default Button;
