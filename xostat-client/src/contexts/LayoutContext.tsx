import React from "react";

import { LAYOUT } from "../constants";
import useSettingsState from "../hooks/useSettingsState";

const initialState = {
  layout: LAYOUT.FLUID,
  setLayout: (layout: string) => {},
};

const LayoutContext = React.createContext(initialState);

interface LayoutProviderType {
  children: React.ReactNode;
}

function LayoutProvider({ children }: LayoutProviderType) {
  const [layout, setLayout] = useSettingsState("layout", LAYOUT.FLUID);

  return (
    <LayoutContext.Provider
      value={{
        layout,
        setLayout,
      }}
    >
      {children}
    </LayoutContext.Provider>
  );
}

export { LayoutProvider, LayoutContext };
