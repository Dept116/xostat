import React from "react";
import { Helmet } from "react-helmet-async";
// import { Container, Row, Col } from "react-bootstrap";
import { Container, Row } from "react-bootstrap";

import Header from "./Header";
import Titlecard from "./Titlecard";
import Totals from "./Totals";
import MinMaxAvg from "./MinMaxAvg";

const Default = () => (
  <React.Fragment>
    <Helmet title="XOStat" />
    <Container fluid className="p-0">
      <Header />
      <Row>
        <Titlecard />
        <Totals />
      </Row>
      <Row>
        <MinMaxAvg />
      </Row>
    </Container>
  </React.Fragment>
);

export default Default;
