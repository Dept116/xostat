import React from "react";

import { Button, Col, Dropdown, Row } from "react-bootstrap";

import { RefreshCw } from "react-feather";

const Header = () => {
  return (
    <Row className="mb-2 mb-xl-3">
      <Col xs="auto" className="d-none d-sm-block">
        <h1>Revenue</h1>
      </Col>

      <Col xs="auto" className="ms-auto text-end mt-n1">
        <Dropdown className="d-inline me-2">
          <Dropdown.Toggle variant="light" className="bg-white shadow-sm">
            Average
          </Dropdown.Toggle>
          <Dropdown.Menu>
            <Dropdown.Item>Average</Dropdown.Item>
            <Dropdown.Item>Minimum</Dropdown.Item>
            <Dropdown.Item>Maximum</Dropdown.Item>
          </Dropdown.Menu>
        </Dropdown>
        <Dropdown className="d-inline me-2">
          <Dropdown.Toggle variant="light" className="bg-white shadow-sm">
            Coins
          </Dropdown.Toggle>
          <Dropdown.Menu>
            <Dropdown.Item>Coins</Dropdown.Item>
            <Dropdown.Item>Resources</Dropdown.Item>
          </Dropdown.Menu>
        </Dropdown>
        <Dropdown className="d-inline me-2">
          <Dropdown.Toggle variant="light" className="bg-white shadow-sm">
            Per Hour
          </Dropdown.Toggle>
          <Dropdown.Menu>
            <Dropdown.Item>Per Hour</Dropdown.Item>
            <Dropdown.Item>Per Match</Dropdown.Item>
          </Dropdown.Menu>
        </Dropdown>
        <Dropdown className="d-inline me-2">
          <Dropdown.Toggle variant="light" className="bg-white shadow-sm">
            For All Matches
          </Dropdown.Toggle>
          <Dropdown.Menu>
            <Dropdown.Item>Premium Only</Dropdown.Item>
            <Dropdown.Item>Excluding Premium</Dropdown.Item>
          </Dropdown.Menu>
        </Dropdown>
        <Button variant="primary" className="shadow-sm">
          <RefreshCw className="feather" />
        </Button>
      </Col>
    </Row>
  );
};

export default Header;
