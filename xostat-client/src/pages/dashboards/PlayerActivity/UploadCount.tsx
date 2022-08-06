import React from "react";
import { Col, Card } from "react-bootstrap";

const UploadCount = () => {
  return (
    <Col className="d-flex">
      <Card className="flex-fill">
        <Card.Header></Card.Header>
        <Card.Body>Upload Count/Player Count</Card.Body>
      </Card>
    </Col>
  );
};

export default UploadCount;
