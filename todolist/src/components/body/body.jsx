import React from 'react';
import ColumnHeader from './column/columnHeader/columnHeader.jsx';
import ColumnBody from './column/columnBody/columnBody.jsx';
import FabButton from './fabButton/fabButton.jsx';
import BodyStyle from './body.style';

const Body = () => {
  return (
    <BodyStyle className="body">
      <ColumnHeader />
      <ColumnBody cards={{}} />
      <FabButton />
    </BodyStyle>
  );
};

export default Body;
