import React from "react";
import { Helmet } from "react-helmet-async";
// import { Container, Row, Col } from "react-bootstrap";
import { Container, Row } from "react-bootstrap";

// import Header from "./Header";
// import Titlecard from "./Titlecard";
// import Totals from "./Totals";
// import MinMaxAvg from "./MinMaxAvg";
import UploadCount from "./UploadCount";
import UploadTracking from "./UploadTracking";
import AveragePlayer from "./AveragePlayer";
import GameModeBreakDown from "./GameModeBreakDown";
import WeaponTracking from "./WeaponTracking";

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
      <Row>
        <WeaponTracking />
      </Row>
    </Container>
  </React.Fragment>
);

export default UserProfile;
