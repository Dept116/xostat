import React from "react";
import { Outlet } from "react-router-dom";

import Main from "../components/Main";

const Landing: React.FC = ({ children }) => (
  <Main>
    {children}
    <Outlet />
  </Main>
);

export default Landing;
