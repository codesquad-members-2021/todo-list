import React, { useState, useEffect } from "react";
import ColumnHeader from "./column/columnHeader/columnHeader.jsx";
import ColumnBody from "./column/columnBody/columnBody.jsx";
import FabButton from "./fabButton/fabButton.jsx";
import { getData, getRandomUser } from "../../utils/axios.js";

const Body = () => {
  const [columnData, setColumnData] = useState([]);
  const [userData, setUserData] = useState([]);

  const getColumnData = () => {
    getData("http://localhost:3002/column") //
      .then((response) => setColumnData(response.data));
  };

  const getUserData = () => {
    getRandomUser("http://localhost:3002/defaultUserList") //
      .then(setUserData);
  };

  useEffect(() => {
    getColumnData();
    getUserData();
  }, []);

  return (
    <section className="body">
      {columnData.map(({ columnTitle, cards }, index) => (
        <div className="column" key={index}>
          <ColumnHeader columnTitle={columnTitle} cards={cards} />
          <ColumnBody cards={cards} user={userData} />
        </div>
      ))}
      <FabButton />
    </section>
  );
};

export default Body;
