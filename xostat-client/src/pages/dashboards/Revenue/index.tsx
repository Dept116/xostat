import React from "react";
import { Helmet } from "react-helmet-async";
import { Container, Row, Col } from "react-bootstrap";

import Fuel from "./Fuel";
import Leaders from "./Leaders";
import Missions from "./Missions";
import Raids from "./Raids";
import Header from "./Header";

const UserProfile = () => (
  <React.Fragment>
    <Helmet title="XOStat" />
    <Container fluid className="p-0">
      <Header />
      <Col>
        <Row>
          <Missions />
          <Fuel />
        </Row>
        <Row>
          <Raids />
          <Leaders />
        </Row>
      </Col>
    </Container>
  </React.Fragment>
);

export default UserProfile;
