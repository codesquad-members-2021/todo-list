import React from "react";

const Form = ({ onSubmit = e => e.preventDefault(), children }) => (
  <form onSubmit={onSubmit} noValidate>
    {children}
  </form>
);

export default Form;
