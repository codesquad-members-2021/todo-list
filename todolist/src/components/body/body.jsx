import React from "react";
import ColumnHeader from "./column/columnHeader/columnHeader.jsx";
import ColumnBody from "./column/columnBody/columnBody.jsx";
import FabButton from "./fabButton/fabButton.jsx";

const Body = () => {
  return (
    <section className="body">
      <ColumnHeader />
      <ColumnBody cards={{}} />
      <FabButton />
    </section>
  );
};

export default Body;
