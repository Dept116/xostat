import React from "react";

import { Col, Row } from "react-bootstrap";

//import { Calendar, Filter, RefreshCw } from "react-feather";

const Header = () => {
  return (
    <Row className="mb-2 mb-xl-3">
      <Col xs="auto" className="d-none d-sm-block">
        <h1>User Profiles</h1>
      </Col>
    </Row>
  );
};

export default Header;
