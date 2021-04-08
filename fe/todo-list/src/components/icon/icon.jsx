import React from 'react';

function PlusButton() {
  return <i className="fas fa-plus"></i>;
}
function TimesButton() {
  return <i className="fas fa-times"></i>;
}
function BarButton() {
  return <i className="fas fa-bars"></i>;
}

function Icon({ type }) {
  return {
    plus: <PlusButton />,
    times: <TimesButton />,
    bar: <BarButton />,
  }[type];
}

export default Icon;
