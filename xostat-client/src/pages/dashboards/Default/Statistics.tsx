import React from "react";
import { useTranslation } from "react-i18next";
import { Col, Card, Row, Container } from "react-bootstrap";
import { MathComponent } from "mathjax-react";

import useAuth from "../../../hooks/useAuth";

const Statistics = () => {
  const { t } = useTranslation();

  let { user } = useAuth(); // TODO stubs for now
  const nicknames = ["nickname1", "nickname2", "nickname3"];
  const games = 9999;
  const wins = 9999;
  const mvp = 9999;
  const kills = 9999;
  const assists = 9999;

  let winRate = 0;
  let mvpRate = 0;
  let contribRate = 0;

  if (games > 0) {
    winRate = (100.0 * wins) / games;
    mvpRate = (100.0 * mvp) / games;
    contribRate = (100.0 * (kills + assists)) / games;
  }

  const userDisplay = user ? user : "visitor";
  const nicknameDisplay = nicknames.map((_nickname, i, _container) => (
    <>
      {_nickname}
      {i < _container.length - 1 ? ", " : ""}
    </>
  ));

  return (
    <Row>
      <Col md="6" xl className="d-flex">
        <Card className="illustration flex-fill">
          <Card.Body className="p-0 d-flex flex-fill">
            <div className="illustration-text p-3 m-1">
              <h1 className="illustration-text">
                {t("Welcome back")}, {userDisplay}!
              </h1>
              <h2 className="mb-0">{nicknameDisplay}</h2>
            </div>
          </Card.Body>
        </Card>
      </Col>
      <Col md="6" xl className="d-flex">
        <Card className="flex-fill">
          <Card.Body className="py-4">
            <Container>
              <Row>
                <Col>
                  <div className="row d-flex justify-content-center">
                    <div className="flex-grow-1">
                      <h3 className="mb-2">Games</h3>
                      <p className="mb-2">{games}</p>
                    </div>
                  </div>
                </Col>
                <Col>
                  <div className="row d-flex justify-content-center">
                    <div className="flex-grow-1">
                      <h3 className="mb-2">Wins</h3>
                      <p className="mb-2">{wins}</p>
                    </div>
                  </div>
                </Col>
                <Col>
                  <div className="row d-flex justify-content-center">
                    <div className="flex-grow-1">
                      <h3 className="mb-2">WR</h3>
                      <p className="mb-2">{winRate}%</p>
                    </div>
                  </div>
                </Col>
              </Row>
              <Row>
                <Col>
                  <div className="row d-flex justify-content-center">
                    <div className="flex-grow-1">
                      <h3 className="mb-2">MVP</h3>
                      <p className="mb-2">{mvp}</p>
                    </div>
                  </div>
                </Col>
                <Col>
                  <div className="row d-flex justify-content-center">
                    <div className="flex-grow-1">
                      <h3 className="mb-2">MVP%</h3>
                      <p className="mb-2">{mvpRate}%</p>
                    </div>
                  </div>
                </Col>
              </Row>
              <Row>
                <Col>
                  <div className="row d-flex justify-content-center">
                    <div className="flex-grow-1">
                      <h3 className="mb-2">Kills</h3>
                      <p className="mb-2">{kills}</p>
                    </div>
                  </div>
                </Col>
                <Col>
                  <div className="row d-flex justify-content-center">
                    <div className="flex-grow-1">
                      <h3 className="mb-2">Assists</h3>
                      <p className="mb-2">{assists}</p>
                    </div>
                  </div>
                </Col>
                <Col>
                  <div className="row d-flex justify-content-center">
                    <div className="flex-grow-1">
                      <h2 className="mb-2">
                        <MathComponent
                          mathml={String.raw`
                        <math>
                          <mrow>
                            <mfrac>
                            <mi>K+A</mi>
                            <mi>G</mi>
                            </mfrac>
                          </mrow>
                        </math>
                        `}
                        />
                      </h2>
                      <p className="mb-2">{contribRate}%</p>
                    </div>
                  </div>
                </Col>
              </Row>
            </Container>
          </Card.Body>
        </Card>
      </Col>
    </Row>
  );
};

export default Statistics;
