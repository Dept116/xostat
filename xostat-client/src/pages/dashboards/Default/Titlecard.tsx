import React from "react";
import { useTranslation } from "react-i18next";
import { Col, Card } from "react-bootstrap";

import useAuth from "../../../hooks/useAuth";

const Titlecard = () => {
  const { t } = useTranslation();

  let { user } = useAuth(); // TODO stubs for now
  const nicknames = ["nickname1", "nickname2", "nickname3"];
  const userDisplay = user ? user : "visitor";
  const nicknameDisplay = nicknames.map((_nickname, i, _container) => (
    <>
      {_nickname}
      {i < _container.length - 1 ? ", " : ""}
    </>
  ));

  return (
    <Col md="6" xl className="d-flex">
      <Card className="illustration flex-fill">
        <Card.Body className="p-0 d-flex flex-fill">
          <div className="illustration-text p-3 m-1">
            <h1 className="illustration-text">
              {t("Welcome back")}, {userDisplay}!
            </h1>
            <h2 className="mb-0">{nicknameDisplay}</h2>
          </div>
        </Card.Body>
      </Card>
    </Col>
  );
};

export default Titlecard;
