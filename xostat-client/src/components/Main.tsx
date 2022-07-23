import React from "react";
import classNames from "classnames";

interface AuthGuardType {
  className?: string;
  children: React.ReactNode;
}

const Main = ({ className, children }: AuthGuardType) => (
  <div className={classNames("main", className)}>{children}</div>
);

export default Main;
