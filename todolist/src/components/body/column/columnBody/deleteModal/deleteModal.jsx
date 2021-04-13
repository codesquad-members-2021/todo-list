import React from "react";
import DeleteModalTitle from "./deleteModalTitle.jsx";
import DeleteModalCancelButton from "./deleteModalCancelButton.jsx";
import DeleteModalDeleteButton from "./deleteModalDeleteButton.jsx";

const DeleteModal = () => {
  return (
    <div className="delete-modal">
      <DeleteModalTitle />
      <DeleteModalCancelButton />
      <DeleteModalDeleteButton />
    </div>
  );
};

export default DeleteModal;
