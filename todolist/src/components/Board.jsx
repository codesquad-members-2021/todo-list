import Column from "./column/Column";

export default function Board({ handleLog }) {
  return (
    <>
      <Column onLog={handleLog} />
    </>
  );
}
