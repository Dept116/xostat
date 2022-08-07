import React from "react";
import { Helmet } from "react-helmet-async";
import { Container, Row } from "react-bootstrap";
// import { Container, Row } from "react-bootstrap";

import Header from "./Header";
import MatchHistory from "./MatchHistory";
// import Titlecard from "./Titlecard";
// import Totals from "./Totals";
// import MinMaxAvg from "./MinMaxAvg";

const UserProfile = () => (
  <React.Fragment>
    <Helmet title="XOStat" />
    <Container fluid className="p-0">
      <Header />
      <Row>
        <MatchHistory />
      </Row>
    </Container>
  </React.Fragment>
);

export default UserProfile;
