import React from "react";
import { Col, Card, Row, Container } from "react-bootstrap";
import { MathComponent } from "mathjax-react";

const Totals = () => {
  let games = 0;
  let wins = 0;
  let mvp = 0;
  let kills = 0;
  let assists = 0;

  let winRate = 0;
  let mvpRate = 0;
  let contribRate = 0;

  if (games > 0) {
    winRate = (100.0 * wins) / games;
    mvpRate = (100.0 * mvp) / games;
    contribRate = (100.0 * (kills + assists)) / games;
  }

  return (
    <Col md="6" xl className="d-flex">
      <Card className="flex-fill">
        <Card.Body className="py-4">
          <Container>
            <Row>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">Games</h3>
                    <p className="mb-2">{games}</p>
                  </div>
                </div>
              </Col>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">Wins</h3>
                    <p className="mb-2">{wins}</p>
                  </div>
                </div>
              </Col>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">WR</h3>
                    <p className="mb-2">{winRate}%</p>
                  </div>
                </div>
              </Col>
            </Row>
            <Row>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">MVP</h3>
                    <p className="mb-2">{mvp}</p>
                  </div>
                </div>
              </Col>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">MVP%</h3>
                    <p className="mb-2">{mvpRate}%</p>
                  </div>
                </div>
              </Col>
            </Row>
            <Row>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">Kills</h3>
                    <p className="mb-2">{kills}</p>
                  </div>
                </div>
              </Col>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">Assists</h3>
                    <p className="mb-2">{assists}</p>
                  </div>
                </div>
              </Col>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
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
  );
};

export default Totals;
