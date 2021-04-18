import { useState } from "react";

const useToggle = (initialValue = true) => {
  const [value, setValue] = useState(initialValue);

  return [
    value,
    {
      set: setValue,
      toggle: () => setValue(flag => !flag)
    }
  ];
};

export default useToggle;