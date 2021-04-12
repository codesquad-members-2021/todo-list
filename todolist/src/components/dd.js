const iconX = styled.div`
  position: absolute;
  right: 80px;
  top: 50px;
`;

function LogStorage({ LogStorageDom }) {
  return (
    <>
      <LogStorageBlock className="logStorage appear" ref={LogStorageDom}>
        <iconX>
          <HiX></HiX>
        </iconX>
      </LogStorageBlock>
    </>
  );
}
