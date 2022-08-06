import React from "react";
// import { useTranslation } from "react-i18next";
import { Col, Card, Container, Row } from "react-bootstrap";

// import useAuth from "../../../hooks/useAuth";

const Titlecard = () => {
  // const { t } = useTranslation();
  // let { user } = useAuth(); // TODO stubs for now
  // const nicknames = ["nickname1", "nickname2", "nickname3"];
  // const userDisplay = user ? user : "Rot_Fish_Bandit";
  // const nicknameDisplay = nicknames.map((_nickname, i, _container) => (
  //   <>
  //     {_nickname}
  //     {i < _container.length - 1 ? ", " : ""}
  //   </>
  // ));

  return (
    <Col md="6" xl className="d-flex">
      <Card className="flex-fill">
        <Card.Body className="py-4">
          <Container>
            <Row className="my-auto">
              <Col className="my-auto">
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">Uploaded</h3>
                    <p className="mb-2">{"0"}</p>
                  </div>
                </div>
              </Col>
              <Col className="my-auto">
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">Recorded</h3>
                    <p className="mb-2">{"0"}</p>
                  </div>
                </div>
              </Col>
            </Row>
            <Row className="my-auto">
              <Col className="my-auto">
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">MMR</h3>
                    <p className="mb-2">{"0"}</p>
                  </div>
                </div>
              </Col>
            </Row>
          </Container>
        </Card.Body>
        <Card.Footer className="p0">
          <small className="text-muted">Last updated 3 mins ago</small>
        </Card.Footer>
      </Card>
    </Col>
  );
};

export default Titlecard;
