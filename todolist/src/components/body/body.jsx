import React, { useState, useEffect } from "react";
import ColumnHeader from "./column/columnHeader/columnHeader.jsx";
import ColumnBody from "./column/columnBody/columnBody.jsx";
import FabButton from "./fabButton/fabButton.jsx";
import { getData, getRandomUser } from "../../utils/axios.js";
import BodyStyle from "./body.style";

const Body = () => {
  const [columnData, setColumnData] = useState([]);
  const [userData, setUserData] = useState([]);

  const handleAddButtonClick = (ID) => {
    let newData = columnData;
    newData.forEach((v) => {
      if (v.id === Number(ID)) {
        v.modifyCardFlag = true;
      }
    });
    setColumnData([...newData]);
  };

  const getColumnData = () => {
    getData("http://localhost:3002/column").then((response) => {
      const newData = response.data;
      newData.map((columnData) => (columnData.modifyCardFlag = false));
      setColumnData(newData);
    });
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
      {columnData.map(({ columnTitle, cards, modifyCardFlag, id }, index) => (
        <BodyStyle className="column" key={index}>
          <ColumnHeader
            id={id}
            columnTitle={columnTitle}
            cards={cards}
            handleAddButtonClick={handleAddButtonClick}
          />
          <ColumnBody
            modifyCardFlag={modifyCardFlag}
            columnTitle={columnTitle}
            cards={cards}
            user={userData}
          />
        </BodyStyle>
      ))}
      <FabButton />
    </section>
  );
};

export default Body;
