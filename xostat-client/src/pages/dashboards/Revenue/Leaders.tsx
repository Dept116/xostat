import React from "react";
import { Col, Card } from "react-bootstrap";

const UploadCount = () => {
  return (
    <Col className="d-flex">
      <Card className="flex-fill">
        <Card.Header>Top 3</Card.Header>
        <Card.Body>Top 3 earners</Card.Body>
      </Card>
    </Col>
  );
};

export default UploadCount;
