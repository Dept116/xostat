import React from "react";
import { Helmet } from "react-helmet-async";
import { Container, Row, Nav } from "react-bootstrap";

import Header from "./Header";
import Titlecard from "./Titlecard";
import Totals from "./Totals";
import MinMaxAvg from "./MinMaxAvg";
import MatchHistory from "./MatchHistory";

const UserProfile = () => (
  <React.Fragment>
    <Helmet title="XOStat" />
    <Container fluid className="p-0">
      <Header />
      <Row className="mb-4">
        <Nav justify defaultActiveKey={"#stats"}>
          <Nav.Item>
            <Nav.Link href="#stats">Stats</Nav.Link>
          </Nav.Item>
          <Nav.Item>
            <Nav.Link href="#graphs">Graphs</Nav.Link>
          </Nav.Item>
          <Nav.Item>
            <Nav.Link href="#weapons">Weapons</Nav.Link>
          </Nav.Item>
          <Nav.Item>
            <Nav.Link href="#movement">Movement</Nav.Link>
          </Nav.Item>
          <Nav.Item>
            <Nav.Link href="#cabins">Cabins</Nav.Link>
          </Nav.Item>
          <Nav.Item>
            <Nav.Link href="#ps">Power Scores</Nav.Link>
          </Nav.Item>
          <Nav.Item>
            <Nav.Link href="#history">Match History</Nav.Link>
          </Nav.Item>
          <Nav.Item>
            <Nav.Link href="#groups">Played With</Nav.Link>
          </Nav.Item>
        </Nav>
      </Row>
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

export default UserProfile;
