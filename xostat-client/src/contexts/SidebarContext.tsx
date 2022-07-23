import React, { useState } from "react";

import { SIDEBAR_POSITION, SIDEBAR_BEHAVIOR } from "../constants";
import useSettingsState from "../hooks/useSettingsState";

const initialState = {
  isOpen: true,
  setIsOpen: (open: boolean) => {},
  setPosition: (position: string) => {},
  setBehavior: (behavior: string) => {},
  position: SIDEBAR_POSITION.LEFT,
  behavior: SIDEBAR_BEHAVIOR.STICKY,
};

const SidebarContext = React.createContext(initialState);

interface SidebarProviderType {
  children: React.ReactNode;
}

function SidebarProvider({ children }: SidebarProviderType) {
  const [isOpen, setIsOpen] = useState(true);
  const [position, setPosition] = useSettingsState(
    "sidebarPosition",
    SIDEBAR_POSITION.LEFT
  );
  const [behavior, setBehavior] = useSettingsState(
    "sidebarBehavior",
    SIDEBAR_BEHAVIOR.STICKY
  );

  return (
    <SidebarContext.Provider
      value={{
        isOpen,
        setIsOpen,
        position,
        setPosition,
        behavior,
        setBehavior,
      }}
    >
      {children}
    </SidebarContext.Provider>
  );
}

export { SidebarProvider, SidebarContext };
