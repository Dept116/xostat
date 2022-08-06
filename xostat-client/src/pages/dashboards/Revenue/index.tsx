import React from "react";
import { Helmet } from "react-helmet-async";
// import { Container, Row, Col } from "react-bootstrap";
import { Container, Row } from "react-bootstrap";

// import Header from "./Header";
// import Titlecard from "./Titlecard";
// import Totals from "./Totals";
// import MinMaxAvg from "./MinMaxAvg";
import UploadCount from "./CostOfFuel";
import UploadTracking from "./ResourcesEarnedToday";
import AveragePlayer from "./Best8v8";
import GameModeBreakDown from "./BestGameMode";

const UserProfile = () => (
  <React.Fragment>
    <Helmet title="XOStat" />
    <Container fluid className="p-0">
      <Row>
        <UploadCount />
        <UploadTracking />
      </Row>
      <Row>
        <AveragePlayer />
        <GameModeBreakDown />
      </Row>
    </Container>
  </React.Fragment>
);

export default UserProfile;
