import React from "react";
import { Helmet } from "react-helmet-async";
// import { Container, Row, Col } from "react-bootstrap";
import { Container, Row } from "react-bootstrap";

// import Header from "./Header";
// import Titlecard from "./Titlecard";
// import Totals from "./Totals";
// import MinMaxAvg from "./MinMaxAvg";
import CostOfFuel from "./CostOfFuel";
import ResourceEarnedToday from "./ResourcesEarnedToday";
import Best8v8 from "./Best8v8";
import BestGameMode from "./BestGameMode";

const UserProfile = () => (
  <React.Fragment>
    <Helmet title="XOStat" />
    <Container fluid className="p-0">
      <Row>
        <Best8v8 />
        <BestGameMode />
      </Row>
      <Row>
        <CostOfFuel />
        <ResourceEarnedToday />
      </Row>
    </Container>
  </React.Fragment>
);

export default UserProfile;